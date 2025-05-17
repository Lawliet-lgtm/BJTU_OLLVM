; ModuleID = 'sensitive_api_project_ir_build_xRd7SI/sensitive_api_project.combined_for_opt.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StringStruct = type { [20 x i8], i8* }

@.str = private unnamed_addr constant [68 x i8] c"[SYSTEM_STUB] Attempting to spawn child process with command: \22%s\22\0A\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"[SYSTEM_STUB] Child process for \22%s\22 simulated.\0A\00", align 1
@.str.2 = private unnamed_addr constant [64 x i8] c"[SYSTEM_STUB] Requesting sudo/root privileges to execute: \22%s\22\0A\00", align 1
@.str.3 = private unnamed_addr constant [90 x i8] c"[SYSTEM_STUB] Privileged command execution simulated for \22%s\22. Assuming success (ret 0).\0A\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"[SYSTEM_STUB] Fetching kernel version information...\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"Linux version 5.15.0-generic (mock)\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"[SYSTEM_STUB] Kernel info (simulated): %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [43 x i8] c"[DATABASE_STUB] Executing SQL query: \22%s\22\0A\00", align 1
@.str.8 = private unnamed_addr constant [66 x i8] c"[DATABASE_STUB] Fetching row %d (simulated data: user%d, pass%d)\0A\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"[DATABASE_STUB] Query finished.\0A\00", align 1
@.str.10 = private unnamed_addr constant [71 x i8] c"[NETWORK_STUB] Attempting to establish SSL/TLS connection to %s:%d...\0A\00", align 1
@.str.1.11 = private unnamed_addr constant [8 x i8] c"0.0.0.0\00", align 1
@.str.2.12 = private unnamed_addr constant [53 x i8] c"[NETWORK_STUB] Error: Cannot connect to invalid IP.\0A\00", align 1
@.str.3.13 = private unnamed_addr constant [72 x i8] c"[NETWORK_STUB] Connection to %s established (simulated socket fd: %d).\0A\00", align 1
@.str.4.14 = private unnamed_addr constant [67 x i8] c"[NETWORK_STUB] Sending %d bytes of data over socket %d: \22%.*s...\22\0A\00", align 1
@.str.5.15 = private unnamed_addr constant [65 x i8] c"[NETWORK_STUB] Attempting to receive %d bytes from socket %d...\0A\00", align 1
@.str.6.16 = private unnamed_addr constant [31 x i8] c"[NETWORK_STUB] Received: \22%s\22\0A\00", align 1
@.str.7.17 = private unnamed_addr constant [55 x i8] c"[NETWORK_STUB] Failed to allocate buffer for receive.\0A\00", align 1
@.str.8.18 = private unnamed_addr constant [35 x i8] c"[NETWORK_STUB] Closing socket %d.\0A\00", align 1
@.str.19 = private unnamed_addr constant [54 x i8] c"===== Sensitive API Project - Main Entry Point =====\0A\00", align 1
@.str.1.20 = private unnamed_addr constant [49 x i8] c"Core string operations finished with result: %d\0A\00", align 1
@.str.2.21 = private unnamed_addr constant [45 x i8] c"===== Sensitive API Project - Exiting =====\0A\00", align 1
@globalString = dso_local global [25 x i8] c"This is a global string.\00", align 16
@__const.execute_core_string_operations.localString = private unnamed_addr constant [24 x i8] c"This is a local string.\00", align 16
@.str.24 = private unnamed_addr constant [33 x i8] c"This is a heap-allocated string.\00", align 1
@.str.1.25 = private unnamed_addr constant [39 x i8] c"Error: Failed to allocate heapString.\0A\00", align 1
@.str.2.26 = private unnamed_addr constant [13 x i8] c"Struct Fixed\00", align 1
@.str.3.27 = private unnamed_addr constant [15 x i8] c"Struct Dynamic\00", align 1
@.str.4.28 = private unnamed_addr constant [51 x i8] c"Error: Failed to allocate myStruct.dynamicString.\0A\00", align 1
@.str.5.29 = private unnamed_addr constant [14 x i8] c"192.168.1.100\00", align 1
@.str.6.30 = private unnamed_addr constant [34 x i8] c"UserCredentials:admin/password123\00", align 1
@.str.7.31 = private unnamed_addr constant [22 x i8] c"secretkey_for_aes_256\00", align 1
@.str.8.32 = private unnamed_addr constant [52 x i8] c"SELECT * FROM user_accounts WHERE username='admin';\00", align 1
@.str.9.33 = private unnamed_addr constant [16 x i8] c"/bin/ls -l /tmp\00", align 1
@.str.10.34 = private unnamed_addr constant [39 x i8] c"--- Core String Operations Output ---\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"1. Global String: %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"2. Local String: %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"3. Heap String: %s\0A\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"4. Struct Fixed: %s\0A\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"5. Struct Dynamic: %s\0A\00", align 1
@.str.16 = private unnamed_addr constant [43 x i8] c"--- End Core String Operations Output ---\0A\00", align 1
@.str.37 = private unnamed_addr constant [73 x i8] c"[CRYPTO_STUB] Encrypting data with AES using key (key_len %lu): \22%s...\22\0A\00", align 1
@.str.1.38 = private unnamed_addr constant [5 x i8] c"ENC_\00", align 1
@.str.2.39 = private unnamed_addr constant [5 x i8] c"_TAG\00", align 1
@.str.3.40 = private unnamed_addr constant [66 x i8] c"[CRYPTO_STUB] Simulated encrypted output (data_len %lu): \22%s...\22\0A\00", align 1
@.str.4.41 = private unnamed_addr constant [35 x i8] c"Encrypted payload (simulated): %s\0A\00", align 1
@.str.5.43 = private unnamed_addr constant [59 x i8] c"[CRYPTO_STUB] Decrypting data with AES using key: \22%s...\22\0A\00", align 1
@.str.6.44 = private unnamed_addr constant [48 x i8] c"[CRYPTO_STUB] Simulated decrypted output: \22%s\22\0A\00", align 1
@.str.7.42 = private unnamed_addr constant [61 x i8] c"[CRYPTO_STUB] Releasing memory for data at 0x63bdbdb37700..\0A\00", align 1
@.str.8.45 = private unnamed_addr constant [52 x i8] c"[CRYPTO_STUB] Generating random salt of length %d.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @spawn_child_process(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i64 0, i64 0), i8* noundef %3)
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1, i64 0, i64 0), i8* noundef %5)
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @execute_privileged_command(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([64 x i8], [64 x i8]* @.str.2, i64 0, i64 0), i8* noundef %3)
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([90 x i8], [90 x i8]* @.str.3, i64 0, i64 0), i8* noundef %5)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @get_kernel_version_info(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i64 0, i64 0))
  %7 = load i8*, i8** %3, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %26

9:                                                ; preds = %2
  %10 = load i32, i32* %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %26

12:                                               ; preds = %9
  store i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0), i8** %5, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = load i8*, i8** %5, align 8
  %15 = load i32, i32* %4, align 4
  %16 = sub nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = call i8* @strncpy(i8* noundef %13, i8* noundef %14, i64 noundef %17) #5
  %19 = load i8*, i8** %3, align 8
  %20 = load i32, i32* %4, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %19, i64 %22
  store i8 0, i8* %23, align 1
  %24 = load i8*, i8** %3, align 8
  %25 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8* noundef %24)
  br label %26

26:                                               ; preds = %12, %9, %2
  ret void
}

; Function Attrs: nounwind
declare i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @simulate_database_query(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.7, i64 0, i64 0), i8* noundef %4)
  store i32 0, i32* %3, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %19

9:                                                ; preds = %6
  %10 = load i32, i32* %3, align 4
  %11 = add nsw i32 %10, 1
  %12 = load i32, i32* %3, align 4
  %13 = load i32, i32* %3, align 4
  %14 = mul nsw i32 %13, 100
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.8, i64 0, i64 0), i32 noundef %11, i32 noundef %12, i32 noundef %14)
  br label %16

16:                                               ; preds = %9
  %17 = load i32, i32* %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %3, align 4
  br label %6, !llvm.loop !6

19:                                               ; preds = %6
  %20 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.9, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @establish_secure_connection(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i8*, i8** %3, align 8
  %7 = load i32, i32* %4, align 4
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @.str.10, i64 0, i64 0), i8* noundef %6, i32 noundef %7)
  %9 = load i8*, i8** %3, align 8
  %10 = call i32 @strcmp(i8* noundef %9, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1.11, i64 0, i64 0)) #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2.12, i64 0, i64 0))
  br label %18

14:                                               ; preds = %2
  store i32 5339, i32* %5, align 4
  %15 = load i8*, i8** %3, align 8
  %16 = load i32, i32* %5, align 4
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.3.13, i64 0, i64 0), i8* noundef %15, i32 noundef %16)
  br label %18

18:                                               ; preds = %14, %12
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(i8* noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @send_data_over_socket(i32 noundef %0, i8* noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = load i32, i32* %4, align 4
  %9 = load i32, i32* %6, align 4
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %14

12:                                               ; preds = %3
  %13 = load i32, i32* %6, align 4
  br label %14

14:                                               ; preds = %12, %11
  %15 = phi i32 [ 10, %11 ], [ %13, %12 ]
  %16 = load i8*, i8** %5, align 8
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4.14, i64 0, i64 0), i32 noundef %7, i32 noundef %8, i32 noundef %15, i8* noundef %16)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @receive_data_from_socket(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %8 = load i32, i32* %5, align 4
  %9 = load i32, i32* %4, align 4
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([65 x i8], [65 x i8]* @.str.5.15, i64 0, i64 0), i32 noundef %8, i32 noundef %9)
  %11 = load i32, i32* %5, align 4
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = call noalias i8* @malloc(i64 noundef %13) #5
  store i8* %14, i8** %6, align 8
  %15 = load i8*, i8** %6, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %42

17:                                               ; preds = %2
  store i32 0, i32* %7, align 4
  br label %18

18:                                               ; preds = %31, %17
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %34

22:                                               ; preds = %18
  %23 = call i32 @rand() #5
  %24 = srem i32 %23, 26
  %25 = add nsw i32 65, %24
  %26 = trunc i32 %25 to i8
  %27 = load i8*, i8** %6, align 8
  %28 = load i32, i32* %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %27, i64 %29
  store i8 %26, i8* %30, align 1
  br label %31

31:                                               ; preds = %22
  %32 = load i32, i32* %7, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %7, align 4
  br label %18, !llvm.loop !8

34:                                               ; preds = %18
  %35 = load i8*, i8** %6, align 8
  %36 = load i32, i32* %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  store i8 0, i8* %38, align 1
  %39 = load i8*, i8** %6, align 8
  %40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.6.16, i64 0, i64 0), i8* noundef %39)
  %41 = load i8*, i8** %6, align 8
  store i8* %41, i8** %3, align 8
  br label %44

42:                                               ; preds = %2
  %43 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([55 x i8], [55 x i8]* @.str.7.17, i64 0, i64 0))
  store i8* null, i8** %3, align 8
  br label %44

44:                                               ; preds = %42, %34
  %45 = load i8*, i8** %3, align 8
  ret i8* %45
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @close_socket_connection(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.18, i64 0, i64 0), i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @.str.19, i64 0, i64 0))
  call void @srand(i32 noundef 32768) #5
  %8 = call i32 @execute_core_string_operations()
  store i32 %8, i32* %6, align 4
  %9 = load i32, i32* %6, align 4
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1.20, i64 0, i64 0), i32 noundef %9)
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2.21, i64 0, i64 0))
  %12 = load i32, i32* %6, align 4
  ret i32 %12
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @execute_core_string_operations() #0 {
  %1 = alloca [24 x i8], align 16
  %2 = alloca i8*, align 8
  %3 = alloca %struct.StringStruct, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = bitcast [24 x i8]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 getelementptr inbounds ([24 x i8], [24 x i8]* @__const.execute_core_string_operations.localString, i32 0, i32 0), i64 24, i1 false)
  %7 = call noalias i8* @malloc(i64 noundef 30) #5
  store i8* %7, i8** %2, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %0
  %11 = load i8*, i8** %2, align 8
  %12 = call i8* @strcpy(i8* noundef %11, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.24, i64 0, i64 0)) #5
  br label %15

13:                                               ; preds = %0
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.1.25, i64 0, i64 0))
  br label %15

15:                                               ; preds = %13, %10
  %16 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 0
  %17 = getelementptr inbounds [20 x i8], [20 x i8]* %16, i64 0, i64 0
  %18 = call i8* @strncpy(i8* noundef %17, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2.26, i64 0, i64 0), i64 noundef 19) #5
  %19 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 0
  %20 = getelementptr inbounds [20 x i8], [20 x i8]* %19, i64 0, i64 19
  store i8 0, i8* %20, align 1
  %21 = call noalias i8* @malloc(i64 noundef 20) #5
  %22 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  store i8* %21, i8** %22, align 8
  %23 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %24 = load i8*, i8** %23, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %30

26:                                               ; preds = %15
  %27 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %28 = load i8*, i8** %27, align 8
  %29 = call i8* @strcpy(i8* noundef %28, i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3.27, i64 0, i64 0)) #5
  br label %32

30:                                               ; preds = %15
  %31 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4.28, i64 0, i64 0))
  br label %32

32:                                               ; preds = %30, %26
  call void @establish_secure_connection(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5.29, i64 0, i64 0), i32 noundef 443)
  store i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6.30, i64 0, i64 0), i8** %4, align 8
  %33 = call i8* @encrypt_data_aes(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.31, i64 0, i64 0))
  store i8* %33, i8** %5, align 8
  call void @simulate_database_query(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.8.32, i64 0, i64 0))
  call void @spawn_child_process(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9.33, i64 0, i64 0))
  %34 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.10.34, i64 0, i64 0))
  %35 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @globalString, i64 0, i64 0))
  %36 = getelementptr inbounds [24 x i8], [24 x i8]* %1, i64 0, i64 0
  %37 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i64 0, i64 0), i8* noundef %36)
  %38 = load i8*, i8** %2, align 8
  %39 = icmp ne i8* %38, null
  br i1 %39, label %40, label %43

40:                                               ; preds = %32
  %41 = load i8*, i8** %2, align 8
  %42 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i64 0, i64 0), i8* noundef %41)
  br label %43

43:                                               ; preds = %40, %32
  %44 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 0
  %45 = getelementptr inbounds [20 x i8], [20 x i8]* %44, i64 0, i64 0
  %46 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0), i8* noundef %45)
  %47 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %48 = load i8*, i8** %47, align 8
  %49 = icmp ne i8* %48, null
  br i1 %49, label %50, label %54

50:                                               ; preds = %43
  %51 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %52 = load i8*, i8** %51, align 8
  %53 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i64 0, i64 0), i8* noundef %52)
  br label %54

54:                                               ; preds = %50, %43
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.16, i64 0, i64 0))
  %56 = load i8*, i8** %2, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %60

58:                                               ; preds = %54
  %59 = load i8*, i8** %2, align 8
  call void @free(i8* noundef %59) #5
  store i8* null, i8** %2, align 8
  br label %60

60:                                               ; preds = %58, %54
  %61 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %62 = load i8*, i8** %61, align 8
  %63 = icmp ne i8* %62, null
  br i1 %63, label %64, label %68

64:                                               ; preds = %60
  %65 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  %66 = load i8*, i8** %65, align 8
  call void @free(i8* noundef %66) #5
  %67 = getelementptr inbounds %struct.StringStruct, %struct.StringStruct* %3, i32 0, i32 1
  store i8* null, i8** %67, align 8
  br label %68

68:                                               ; preds = %64, %60
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8* noundef, i8* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @encrypt_data_aes(i8* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = call i64 @strlen(i8* noundef %8) #6
  %10 = load i8*, i8** %5, align 8
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @.str.37, i64 0, i64 0), i64 noundef %9, i8* noundef %10)
  %12 = load i8*, i8** %4, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %2
  %15 = load i8*, i8** %5, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %14, %2
  store i8* null, i8** %3, align 8
  br label %40

18:                                               ; preds = %14
  %19 = load i8*, i8** %4, align 8
  %20 = call i64 @strlen(i8* noundef %19) #6
  store i64 %20, i64* %6, align 8
  %21 = load i64, i64* %6, align 8
  %22 = add i64 %21, 16
  %23 = call noalias i8* @malloc(i64 noundef %22) #5
  store i8* %23, i8** %7, align 8
  %24 = load i8*, i8** %7, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %39

26:                                               ; preds = %18
  %27 = load i8*, i8** %7, align 8
  %28 = call i8* @strcpy(i8* noundef %27, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.38, i64 0, i64 0)) #5
  %29 = load i8*, i8** %7, align 8
  %30 = call i8* @strcat(i8* noundef %29, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.39, i64 0, i64 0)) #5
  %31 = load i8*, i8** %4, align 8
  %32 = call i64 @strlen(i8* noundef %31) #6
  %33 = load i8*, i8** %4, align 8
  %34 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.3.40, i64 0, i64 0), i64 noundef %32, i8* noundef %33)
  %35 = load i8*, i8** %7, align 8
  %36 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4.41, i64 0, i64 0), i8* noundef %35)
  %37 = load i8*, i8** %7, align 8
  call void @release_encrypted_data(i8* noundef %37)
  %38 = load i8*, i8** %7, align 8
  store i8* %38, i8** %3, align 8
  br label %40

39:                                               ; preds = %18
  store i8* null, i8** %3, align 8
  br label %40

40:                                               ; preds = %39, %26, %17
  %41 = load i8*, i8** %3, align 8
  ret i8* %41
}

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8* noundef) #3

; Function Attrs: nounwind
declare i8* @strcat(i8* noundef, i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @release_encrypted_data(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.7.42, i64 0, i64 0))
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = load i8*, i8** %2, align 8
  call void @free(i8* noundef %7) #5
  br label %8

8:                                                ; preds = %6, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @decrypt_data_aes(i8* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([59 x i8], [59 x i8]* @.str.5.43, i64 0, i64 0), i8* noundef %10)
  %12 = load i8*, i8** %4, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %2
  %15 = load i8*, i8** %5, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %14, %2
  store i8* null, i8** %3, align 8
  br label %56

18:                                               ; preds = %14
  %19 = load i8*, i8** %4, align 8
  %20 = call i32 @strncmp(i8* noundef %19, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.38, i64 0, i64 0), i64 noundef 4) #6
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %55

22:                                               ; preds = %18
  %23 = load i8*, i8** %4, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 4
  store i8* %24, i8** %6, align 8
  %25 = load i8*, i8** %6, align 8
  %26 = call i64 @strlen(i8* noundef %25) #6
  store i64 %26, i64* %7, align 8
  %27 = load i8*, i8** %6, align 8
  %28 = call i8* @strstr(i8* noundef %27, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.39, i64 0, i64 0)) #6
  store i8* %28, i8** %8, align 8
  %29 = load i8*, i8** %8, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %31, label %37

31:                                               ; preds = %22
  %32 = load i8*, i8** %8, align 8
  %33 = load i8*, i8** %6, align 8
  %34 = ptrtoint i8* %32 to i64
  %35 = ptrtoint i8* %33 to i64
  %36 = sub i64 %34, %35
  store i64 %36, i64* %7, align 8
  br label %37

37:                                               ; preds = %31, %22
  %38 = load i64, i64* %7, align 8
  %39 = add i64 %38, 1
  %40 = call noalias i8* @malloc(i64 noundef %39) #5
  store i8* %40, i8** %9, align 8
  %41 = load i8*, i8** %9, align 8
  %42 = icmp ne i8* %41, null
  br i1 %42, label %43, label %54

43:                                               ; preds = %37
  %44 = load i8*, i8** %9, align 8
  %45 = load i8*, i8** %6, align 8
  %46 = load i64, i64* %7, align 8
  %47 = call i8* @strncpy(i8* noundef %44, i8* noundef %45, i64 noundef %46) #5
  %48 = load i8*, i8** %9, align 8
  %49 = load i64, i64* %7, align 8
  %50 = getelementptr inbounds i8, i8* %48, i64 %49
  store i8 0, i8* %50, align 1
  %51 = load i8*, i8** %9, align 8
  %52 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6.44, i64 0, i64 0), i8* noundef %51)
  %53 = load i8*, i8** %9, align 8
  store i8* %53, i8** %3, align 8
  br label %56

54:                                               ; preds = %37
  br label %55

55:                                               ; preds = %54, %18
  store i8* null, i8** %3, align 8
  br label %56

56:                                               ; preds = %55, %43, %17
  %57 = load i8*, i8** %3, align 8
  ret i8* %57
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nounwind readonly willreturn
declare i8* @strstr(i8* noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @generate_random_salt(i32 noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.8.45, i64 0, i64 0), i32 noundef %6)
  %8 = load i32, i32* %3, align 4
  %9 = icmp sle i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store i8* null, i8** %2, align 8
  br label %42

11:                                               ; preds = %1
  %12 = load i32, i32* %3, align 4
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = call noalias i8* @malloc(i64 noundef %14) #5
  store i8* %15, i8** %4, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = icmp ne i8* %16, null
  br i1 %17, label %18, label %41

18:                                               ; preds = %11
  store i32 0, i32* %5, align 4
  br label %19

19:                                               ; preds = %32, %18
  %20 = load i32, i32* %5, align 4
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %35

23:                                               ; preds = %19
  %24 = call i32 @rand() #5
  %25 = srem i32 %24, 10
  %26 = add nsw i32 83, %25
  %27 = trunc i32 %26 to i8
  %28 = load i8*, i8** %4, align 8
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8* %28, i64 %30
  store i8 %27, i8* %31, align 1
  br label %32

32:                                               ; preds = %23
  %33 = load i32, i32* %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %5, align 4
  br label %19, !llvm.loop !9

35:                                               ; preds = %19
  %36 = load i8*, i8** %4, align 8
  %37 = load i32, i32* %3, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  store i8 0, i8* %39, align 1
  %40 = load i8*, i8** %4, align 8
  store i8* %40, i8** %2, align 8
  br label %42

41:                                               ; preds = %11
  store i8* null, i8** %2, align 8
  br label %42

42:                                               ; preds = %41, %35, %10
  %43 = load i8*, i8** %2, align 8
  ret i8* %43
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
