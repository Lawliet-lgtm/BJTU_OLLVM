#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e
# Treat unset variables as an error when substituting.
set -u
# Pipelines return the exit status of the last command to exit with a non-zero status,
# or zero if all commands in the pipeline exit successfully.
set -o pipefail

PROGNAME=$(basename "$0")

usage() {
    echo "Usage: $PROGNAME -d <project_directory> [-o <output_ir_file>] [-I <include_dir>]... [-O <opt_level>] [-b] [-X <clang_extra_arg>]..."
    echo ""
    echo "Basic C to LLVM IR options:"
    echo "  -h                      Display this help message and exit."
    echo "  -d <project_directory>  Required. Path to the C project directory."
    echo "  -o <output_ir_file>     Optional. Name of the final LLVM IR output file."
    echo "                          Defaults to <project_name>.ll or <project_name>.bc based on -b."
    echo "  -I <include_dir>        Optional. Add directory to clang's include search path. Can be used multiple times."
    echo "  -O <opt_level>          Optional. Clang optimization level (e.g., O0, O2, Os). Defaults to O0."
    echo "  -b                      Optional. Output LLVM bitcode (.bc) instead of human-readable IR (.ll)."
    echo "  -X <clang_extra_arg>    Optional. Pass an extra argument directly to clang. Can be used multiple times."
    echo ""
    echo "LLVM IR Obfuscation options (implicitly enables obfuscation stage):"
    echo "  -p <pass_so_path>       Optional. Path to the obfuscation pass .so file."
    echo "                          Defaults to './Build/LLVMGlobalsEncryption.so'."
    echo "  -s                      Optional. Enable '-obfstr' option for the obfuscation pass."
    echo "  -f                      Optional. Enable '-obffunc' option for the obfuscation pass."
    echo "  -u                      Optional. Enable '-usetick' option for the obfuscation pass."
    echo ""
    echo "External LLVM IR Linking options:"
    echo "  -l                      Optional. Enable linking with an external functional IR module."
    echo "  -r <external_ir_path>   Optional. Path to the external functional IR module (e.g., .ll or .bc file)."
    echo "                          Defaults to './Test/CryptoUtils.ll'. Only used if -l is specified."
    echo ""
    echo "Compilation to Executable options:"
    echo "  -c                      Optional. Compile the final (potentially obfuscated/linked) IR to an executable."
    echo "  -N <executable_name>    Optional. Name of the output executable. Only used if -c is specified."
    echo "                          Defaults to <project_name>.out or derived from <output_ir_file>."
    echo ""
    echo "  Note: To generate .ll (human-readable IR), llvm-dis must be installed and in PATH."
    echo "        llvm-link must also be installed for linking multiple IR files."
    echo "        opt must be installed for obfuscation."
    echo "        llvm-as must be installed if obfuscated .ll needs to be converted back to .bc for final output."
    echo "        llvm-config must be installed for compiling to executable."
}

# Default values
PROJECT_DIR=""
OUTPUT_FILE_REQUESTED=""
INCLUDE_DIRS_ARGS=()
OPT_LEVEL="O0"
OUTPUT_BITCODE=false
CLANG_EXTRA_ARGS=()

# New feature defaults
OBFUSCATION_ENABLED=false
OBF_PASS_SO_PATH="./Build/LLVMGlobalsEncryption.so" # Relative to script execution dir or use absolute
OBF_OPT_STR=false
OBF_OPT_FUNC=false
OBF_OPT_USETICK=false

LINK_EXTERNAL_IR_ENABLED=false
EXTERNAL_IR_MODULE_PATH="./Test/CryptoUtils.ll" # Relative to script execution dir or use absolute

COMPILE_EXECUTABLE_ENABLED=false
EXECUTABLE_NAME=""


# Parse command line options
while getopts "hd:o:I:O:bX:p:sfultr:cN:" opt; do
    case ${opt} in
        h) usage; exit 0 ;;
        d) PROJECT_DIR="$OPTARG" ;;
        o) OUTPUT_FILE_REQUESTED="$OPTARG" ;;
        I) INCLUDE_DIRS_ARGS+=("-I" "$OPTARG") ;;
        O) OPT_LEVEL="$OPTARG" ;;
        b) OUTPUT_BITCODE=true ;;
        X) CLANG_EXTRA_ARGS+=("$OPTARG") ;;
        # Obfuscation
        p) OBF_PASS_SO_PATH="$OPTARG"; OBFUSCATION_ENABLED=true ;;
        s) OBF_OPT_STR=true; OBFUSCATION_ENABLED=true ;;
        f) OBF_OPT_FUNC=true; OBFUSCATION_ENABLED=true ;;
        u) OBF_OPT_USETICK=true; OBFUSCATION_ENABLED=true ;;
        # External Linking
        l) LINK_EXTERNAL_IR_ENABLED=true ;;
        r) EXTERNAL_IR_MODULE_PATH="$OPTARG" ;;
        # Compile to Executable
        c) COMPILE_EXECUTABLE_ENABLED=true ;;
        N) EXECUTABLE_NAME="$OPTARG" ;;
        \?) echo "Invalid option: -$OPTARG" >&2; usage; exit 1 ;;
        :) echo "Option -$OPTARG requires an argument." >&2; usage; exit 1 ;;
    esac
done
shift $((OPTIND -1))

# --- Validations ---
if [ -z "$PROJECT_DIR" ]; then echo "Error: Project directory (-d) is required." >&2; usage; exit 1; fi
if [ ! -d "$PROJECT_DIR" ]; then echo "Error: Project directory '$PROJECT_DIR' not found." >&2; exit 1; fi
if ! command -v clang &> /dev/null; then echo "Error: clang command not found." >&2; exit 1; fi
if ! command -v llvm-link &> /dev/null; then echo "Error: llvm-link command not found, but it's required." >&2; exit 1; fi

if [ "$OUTPUT_BITCODE" = false ] || [ "$OBFUSCATION_ENABLED" = true ]; then # .ll output or obfuscation needs llvm-dis
    if ! command -v llvm-dis &> /dev/null; then
        echo "Error: llvm-dis command not found. Required for .ll output or for obfuscation stage." >&2
        exit 1
    fi
fi
if [ "$OUTPUT_BITCODE" = true ] && [ "$OBFUSCATION_ENABLED" = true ]; then # if obfuscation produces .ll but final is .bc
    if ! command -v llvm-as &> /dev/null; then
        echo "Error: llvm-as command not found. Potentially required if obfuscating to .ll and final output is .bc." >&2
        exit 1
    fi
fi

if [ "$OBFUSCATION_ENABLED" = true ]; then
    if ! command -v opt &> /dev/null; then echo "Error: opt command not found, required for obfuscation." >&2; exit 1; fi
    # Convert OBF_PASS_SO_PATH to absolute path if it's relative
    if [[ "$OBF_PASS_SO_PATH" != /* ]]; then OBF_PASS_SO_PATH="$(pwd)/$OBF_PASS_SO_PATH"; fi
    if [ ! -f "$OBF_PASS_SO_PATH" ]; then echo "Error: Obfuscation pass SO file '$OBF_PASS_SO_PATH' not found." >&2; exit 1; fi
fi

if [ "$LINK_EXTERNAL_IR_ENABLED" = true ]; then
    # Convert EXTERNAL_IR_MODULE_PATH to absolute path if it's relative
    if [[ "$EXTERNAL_IR_MODULE_PATH" != /* ]]; then EXTERNAL_IR_MODULE_PATH="$(pwd)/$EXTERNAL_IR_MODULE_PATH"; fi
    if [ ! -f "$EXTERNAL_IR_MODULE_PATH" ]; then echo "Error: External IR module '$EXTERNAL_IR_MODULE_PATH' not found." >&2; exit 1; fi
fi

if [ "$COMPILE_EXECUTABLE_ENABLED" = true ]; then
    if ! command -v llvm-config &> /dev/null; then echo "Error: llvm-config command not found, required for compiling to executable." >&2; exit 1; fi
fi

# --- Prepare for compilation ---
PROJECT_DIR=$(cd "$PROJECT_DIR" && pwd) # Make project dir absolute
PROJECT_NAME=$(basename "$PROJECT_DIR")

SOURCE_FILES=()
while IFS= read -r -d $'\0' file; do
    SOURCE_FILES+=("$file")
done < <(find "$PROJECT_DIR" -type f \( -name "*.c" -o -name "*.cpp" -o -name "*.cc" \) -print0) # Added .cpp and .cc

if [ ${#SOURCE_FILES[@]} -eq 0 ]; then echo "Error: No .c, .cpp, or .cc files found in '$PROJECT_DIR'." >&2; exit 1; fi

echo "Found source files:"
for sf in "${SOURCE_FILES[@]}"; do echo "  - $sf"; done

# Determine final LLVM IR output file name
if [ -n "$OUTPUT_FILE_REQUESTED" ]; then
    FINAL_IR_OUTPUT_FILE="$OUTPUT_FILE_REQUESTED"
else
    if [ "$OUTPUT_BITCODE" = true ]; then FINAL_IR_OUTPUT_FILE="${PROJECT_NAME}.bc"; else FINAL_IR_OUTPUT_FILE="${PROJECT_NAME}.ll"; fi
fi
# Ensure FINAL_IR_OUTPUT_FILE is absolute or relative to current PWD
if [[ "$FINAL_IR_OUTPUT_FILE" != /* ]]; then
    FINAL_IR_OUTPUT_FILE_ABS="$(pwd)/$FINAL_IR_OUTPUT_FILE"
else
    FINAL_IR_OUTPUT_FILE_ABS="$FINAL_IR_OUTPUT_FILE"
fi
echo "Final LLVM IR output file will be: $FINAL_IR_OUTPUT_FILE_ABS"


# --- Temporary directory for intermediate files ---
TEMP_DIR=$(mktemp -d "${PROJECT_NAME}_ir_build_XXXXXX") # Create a temporary directory
trap 'echo "Cleaning up temporary directory: $TEMP_DIR"; rm -rf "$TEMP_DIR"' EXIT HUP INT QUIT TERM # Ensure cleanup

# --- Stage 1: Compile each source file to an individual .bc (bitcode) file ---
echo ""
echo "--- Stage 1: Compiling sources to individual LLVM bitcode files (in $TEMP_DIR) ---"
INDIVIDUAL_BC_FILES=()

for SOURCE_FILE in "${SOURCE_FILES[@]}"; do
    BASENAME_SOURCE=$(basename "$SOURCE_FILE")
    BASENAME_NO_EXT="${BASENAME_SOURCE%.*}" # Handles .c, .cpp, .cc
    TEMP_BC_OUTPUT_FILE="$TEMP_DIR/${BASENAME_NO_EXT}.bc"

    CLANG_CMD=("clang")
    # For C++, use clang++. Heuristic: if any .cpp or .cc files, or if a .c file might need c++ std lib.
    # A more robust way is to check file extension per file, but for simplicity:
    if [[ "$SOURCE_FILE" == *.cpp ]] || [[ "$SOURCE_FILE" == *.cc ]]; then
        CLANG_CMD=("clang++")
    fi

    CLANG_CMD+=("-c")
    CLANG_CMD+=("-emit-llvm")
    CLANG_CMD+=("-$OPT_LEVEL")

    if [ ${#INCLUDE_DIRS_ARGS[@]} -gt 0 ]; then
        CLANG_CMD+=("${INCLUDE_DIRS_ARGS[@]}")
    fi
    if [ ${#CLANG_EXTRA_ARGS[@]} -gt 0 ]; then
        CLANG_CMD+=("${CLANG_EXTRA_ARGS[@]}")
    fi

    CLANG_CMD+=("-o" "$TEMP_BC_OUTPUT_FILE")
    CLANG_CMD+=("$SOURCE_FILE")

    echo "Compiling $SOURCE_FILE to $TEMP_BC_OUTPUT_FILE..."
    printf "  Executing: %s\n" "$(echo "${CLANG_CMD[@]}" | sed 's/\(-[IObX]\)/\n    \1/g')" # Pretty print
    if ! "${CLANG_CMD[@]}"; then
        echo "Error: Clang failed to compile $SOURCE_FILE." >&2
        exit 1
    fi
    INDIVIDUAL_BC_FILES+=("$TEMP_BC_OUTPUT_FILE")
done
echo "--- Stage 1 Complete ---"


# --- Stage 2: Link individual .bc files into a single combined .bc file ---
echo ""
echo "--- Stage 2: Linking individual bitcode files ---"
CURRENT_IR_ARTIFACT="$TEMP_DIR/00_combined_initial.bc"

LLVM_LINK_CMD=("llvm-link")
LLVM_LINK_CMD+=("-o" "$CURRENT_IR_ARTIFACT")
LLVM_LINK_CMD+=("${INDIVIDUAL_BC_FILES[@]}")

echo "Linking bitcode files to $CURRENT_IR_ARTIFACT..."
printf "  Executing: %q " "${LLVM_LINK_CMD[@]}"
echo ""
if ! "${LLVM_LINK_CMD[@]}"; then
    echo "Error: llvm-link failed." >&2
    exit 1
fi
echo "--- Stage 2 Complete ---"


# --- Stage 3: (Optional) LLVM IR Obfuscation ---
if [ "$OBFUSCATION_ENABLED" = true ]; then
    echo ""
    echo "--- Stage 3: Obfuscating LLVM IR ---"
    OBFUSCATION_INPUT_LL="$TEMP_DIR/01_to_obfuscate.ll"
    OBFUSCATED_OUTPUT_LL="$TEMP_DIR/02_obfuscated.ll"

    echo "Disassembling $CURRENT_IR_ARTIFACT to $OBFUSCATION_INPUT_LL for obfuscation..."
    if ! llvm-dis "$CURRENT_IR_ARTIFACT" -o "$OBFUSCATION_INPUT_LL"; then
        echo "Error: llvm-dis failed before obfuscation." >&2; exit 1
    fi

    OPT_CMD=("opt" "-load" "$OBF_PASS_SO_PATH" "-gvobfus") # Assuming -gvobfus is the main pass trigger
    if [ "$OBF_OPT_STR" = true ]; then OPT_CMD+=("-obfstr"); fi
    if [ "$OBF_OPT_FUNC" = true ]; then OPT_CMD+=("-obffunc"); fi
    if [ "$OBF_OPT_USETICK" = true ]; then OPT_CMD+=("-usetick"); fi
    OPT_CMD+=("-S" "$OBFUSCATION_INPUT_LL" "-o" "$OBFUSCATED_OUTPUT_LL" "-enable-new-pm=0")

    echo "Applying obfuscation pass to $OBFUSCATION_INPUT_LL..."
    printf "  Executing: %q " "${OPT_CMD[@]}"
    echo ""
    if ! "${OPT_CMD[@]}"; then
        echo "Error: opt obfuscation pass failed." >&2
        exit 1
    fi
    CURRENT_IR_ARTIFACT="$OBFUSCATED_OUTPUT_LL" # Output of opt is .ll because of -S
    echo "--- Stage 3 Complete (Output: $CURRENT_IR_ARTIFACT) ---"
else
    echo ""
    echo "--- Stage 3: Obfuscation SKIPPED ---"
fi


# --- Stage 4: (Optional) Link External IR Module ---
if [ "$LINK_EXTERNAL_IR_ENABLED" = true ]; then
    echo ""
    echo "--- Stage 4: Linking external IR module ($EXTERNAL_IR_MODULE_PATH) ---"
    LINKED_EXTERNAL_BC="$TEMP_DIR/03_linked_external.bc"

    LLVM_LINK_EXTERNAL_CMD=("llvm-link")
    LLVM_LINK_EXTERNAL_CMD+=("-o" "$LINKED_EXTERNAL_BC")
    LLVM_LINK_EXTERNAL_CMD+=("$CURRENT_IR_ARTIFACT") # This could be .ll or .bc
    LLVM_LINK_EXTERNAL_CMD+=("$EXTERNAL_IR_MODULE_PATH")

    echo "Linking $CURRENT_IR_ARTIFACT with $EXTERNAL_IR_MODULE_PATH to $LINKED_EXTERNAL_BC..."
    printf "  Executing: %q " "${LLVM_LINK_EXTERNAL_CMD[@]}"
    echo ""
    if ! "${LLVM_LINK_EXTERNAL_CMD[@]}"; then
        echo "Error: llvm-link failed for external module." >&2
        exit 1
    fi
    CURRENT_IR_ARTIFACT="$LINKED_EXTERNAL_BC" # Output of llvm-link is .bc
    echo "--- Stage 4 Complete (Output: $CURRENT_IR_ARTIFACT) ---"
else
    echo ""
    echo "--- Stage 4: Linking external IR SKIPPED ---"
fi


# --- Stage 5: Prepare Final IR Output File ---
echo ""
echo "--- Stage 5: Preparing final IR output file ($FINAL_IR_OUTPUT_FILE_ABS) ---"
# FINAL_IR_OUTPUT_FILE_ABS is the target file path (absolute)
# OUTPUT_BITCODE is true if user wants .bc, false if .ll

mkdir -p "$(dirname "$FINAL_IR_OUTPUT_FILE_ABS")" # Ensure output directory exists

if [ "$OUTPUT_BITCODE" = true ]; then # User wants .bc
    if [[ "$CURRENT_IR_ARTIFACT" == *.ll ]]; then # Current artifact is .ll, need to assemble
        echo "Assembling $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS (bitcode)..."
        if ! llvm-as "$CURRENT_IR_ARTIFACT" -o "$FINAL_IR_OUTPUT_FILE_ABS"; then
            echo "Error: llvm-as failed to convert $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS." >&2; exit 1
        fi
    else # Current artifact is already .bc
        echo "Copying $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS (bitcode)..."
        if ! cp "$CURRENT_IR_ARTIFACT" "$FINAL_IR_OUTPUT_FILE_ABS"; then
            echo "Error: Failed to copy $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS." >&2; exit 1
        fi
    fi
    echo "Successfully generated LLVM Bitcode: $FINAL_IR_OUTPUT_FILE_ABS"
else # User wants .ll
    if [[ "$CURRENT_IR_ARTIFACT" == *.bc ]]; then # Current artifact is .bc, need to disassemble
        echo "Disassembling $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS (human-readable IR)..."
        if ! llvm-dis "$CURRENT_IR_ARTIFACT" -o "$FINAL_IR_OUTPUT_FILE_ABS"; then
            echo "Error: llvm-dis failed to convert $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS." >&2; exit 1
        fi
    else # Current artifact is already .ll
        echo "Copying $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS (human-readable IR)..."
        if ! cp "$CURRENT_IR_ARTIFACT" "$FINAL_IR_OUTPUT_FILE_ABS"; then
            echo "Error: Failed to copy $CURRENT_IR_ARTIFACT to $FINAL_IR_OUTPUT_FILE_ABS." >&2; exit 1
        fi
    fi
    echo "Successfully generated LLVM IR: $FINAL_IR_OUTPUT_FILE_ABS"
fi
echo "--- Stage 5 Complete ---"


# --- Stage 6: (Optional) Compile to Executable ---
if [ "$COMPILE_EXECUTABLE_ENABLED" = true ]; then
    echo ""
    echo "--- Stage 6: Compiling to executable ---"

    if [ -z "$EXECUTABLE_NAME" ]; then
        # Derive executable name from FINAL_IR_OUTPUT_FILE_ABS or PROJECT_NAME
        BASE_IR_NAME=$(basename "$FINAL_IR_OUTPUT_FILE_ABS")
        EXECUTABLE_NAME="${BASE_IR_NAME%.*}.out" # Remove .ll or .bc, add .out
        if [[ "$BASE_IR_NAME" != *.* ]]; then # No extension on IR file
             EXECUTABLE_NAME="${BASE_IR_NAME}.out"
        fi
        if [ -z "$OUTPUT_FILE_REQUESTED" ] && [ -n "$PROJECT_NAME" ]; then # If -o not used, prefer project name based
            EXECUTABLE_NAME="${PROJECT_NAME}.out"
        fi
    fi
    # Ensure EXECUTABLE_NAME is absolute or relative to PWD
    if [[ "$EXECUTABLE_NAME" != /* ]]; then
        EXECUTABLE_NAME_ABS="$(pwd)/$EXECUTABLE_NAME"
    else
        EXECUTABLE_NAME_ABS="$EXECUTABLE_NAME"
    fi

    mkdir -p "$(dirname "$EXECUTABLE_NAME_ABS")" # Ensure output directory exists

    # Determine if C++ linker is needed (heuristic)
    # If any source was .cpp/.cc or if external CryptoUtils.ll implies C++ (safer to include)
    LINKER_LIBS=("-lstdc++") # Default to C++ std lib
    # More sophisticated check: look for C++ symbols in $CURRENT_IR_ARTIFACT or check source file types more carefully.
    # For now, -lstdc++ is often harmless or needed.

    CLANG_EXE_CMD=("clang") # Use clang as it can handle C/C++ and link appropriately with -lstdc++
    # If we had a clear C vs C++ project type, we might choose clang vs clang++ here.
    # But since clang can compile IR from C++ sources and link with C++ libs, it's usually fine.

    CLANG_EXE_CMD+=("$CURRENT_IR_ARTIFACT") # clang can take .ll or .bc
    CLANG_EXE_CMD+=("-o" "$EXECUTABLE_NAME_ABS")
    CLANG_EXE_CMD+=("${LINKER_LIBS[@]}")
    # shellcheck disable=SC2207 # deliberate splitting of llvm-config output
    LLVM_CONFIG_LIBS=($(llvm-config --libs --system-libs --ldflags))
    CLANG_EXE_CMD+=("${LLVM_CONFIG_LIBS[@]}")


    echo "Compiling $CURRENT_IR_ARTIFACT to executable $EXECUTABLE_NAME_ABS..."
    printf "  Executing: %s\n" "$(echo "${CLANG_EXE_CMD[@]}" | sed 's/\(-[lo]\)/\n    \1/g')"
    if ! "${CLANG_EXE_CMD[@]}"; then
        echo "Error: clang failed to compile $CURRENT_IR_ARTIFACT to executable." >&2
        exit 1
    fi
    echo "Successfully generated executable: $EXECUTABLE_NAME_ABS"
    echo "--- Stage 6 Complete ---"
else
    echo ""
    echo "--- Stage 6: Compiling to executable SKIPPED ---"
fi

echo ""
echo "Build process complete."
# Temporary directory $TEMP_DIR will be removed by the trap
exit 0