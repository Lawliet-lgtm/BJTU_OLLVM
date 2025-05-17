project(OLLVM++)    #指定项目的名称
cmake_minimum_required(VERSION 3.13.4)   #指定CMake最低版本

#一些和LLVM的环境导入有关的配置
find_package(LLVM REQUIRED CONFIG)       	
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)										

include_directories("./include")    # 项目的包含文件夹，这样就可以包含 ./include 文件夹中的头文件
													
#LLVM有关的配置项
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})
include_directories(${LLVM_INCLUDE_DIRS})


#向LLVM注册一个LLVMObfuscator的模块，每个模块都对应一个so文件
add_llvm_library( LLVMHello MODULE
    src/HelloWorld.cpp
)
add_llvm_library( LLVMObfuscator MODULE
    src/ObfuscateString.cpp
)
add_llvm_library( LLVMGlobalsEncryption MODULE
    src/GlobalsEncryption.cpp
    src/CryptoUtils.cpp
)
