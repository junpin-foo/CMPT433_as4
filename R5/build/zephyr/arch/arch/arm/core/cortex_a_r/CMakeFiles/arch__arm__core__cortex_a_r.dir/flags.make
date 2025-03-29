# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# compile ASM with /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/arm-zephyr-eabi-gcc
# compile C with /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/arm-zephyr-eabi-gcc
ASM_DEFINES = -DKERNEL -DK_HEAP_MEM_POOL_SIZE=0 -DPICOLIBC_DOUBLE_PRINTF_SCANF -D__LINUX_ERRNO_EXTENSIONS__ -D__PROGRAM_START -D__ZEPHYR_SUPERVISOR__ -D__ZEPHYR__=1

ASM_INCLUDES = -I/home/junpinfoo/zephyrproject/zephyr/kernel/include -I/home/junpinfoo/zephyrproject/zephyr/arch/arm/include -I/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated/zephyr -I/home/junpinfoo/zephyrproject/zephyr/include -I/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3 -I/home/junpinfoo/zephyrproject/zephyr/lib/open-amp/. -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/. -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/r5 -I/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include -I/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/. -I/home/junpinfoo/cmpt433/work/as4/R5/build/modules/libmetal/libmetal/lib/include -I/home/junpinfoo/zephyrproject/modules/lib/open-amp/open-amp/lib/include -isystem /home/junpinfoo/zephyrproject/zephyr/lib/libc/common/include

ASM_FLAGS = -Wshadow -imacros /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated/zephyr/autoconf.h -fno-common -g -gdwarf-4 -fdiagnostics-color=always -mcpu=cortex-r5+nofp.dp -mthumb -mabi=aapcs -mfpu=vfpv3xd -mfloat-abi=hard -mfp16-format=ieee -mtp=soft --sysroot=/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/arm-zephyr-eabi -xassembler-with-cpp -imacros /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/zephyr_stdint.h -D_ASMLANGUAGE -Wno-unused-but-set-variable -fno-asynchronous-unwind-tables -ftls-model=local-exec -fno-reorder-functions --param=min-pagesize=0 -fno-defer-pop -fmacro-prefix-map=/home/junpinfoo/cmpt433/work/as4/R5=CMAKE_SOURCE_DIR -fmacro-prefix-map=/home/junpinfoo/zephyrproject/zephyr=ZEPHYR_BASE -fmacro-prefix-map=/home/junpinfoo/zephyrproject=WEST_TOPDIR -ffunction-sections -fdata-sections -specs=picolibc.specs

C_DEFINES = -DKERNEL -DK_HEAP_MEM_POOL_SIZE=0 -DPICOLIBC_DOUBLE_PRINTF_SCANF -D__LINUX_ERRNO_EXTENSIONS__ -D__PROGRAM_START -D__ZEPHYR_SUPERVISOR__ -D__ZEPHYR__=1

C_INCLUDES = -I/home/junpinfoo/zephyrproject/zephyr/kernel/include -I/home/junpinfoo/zephyrproject/zephyr/arch/arm/include -I/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated/zephyr -I/home/junpinfoo/zephyrproject/zephyr/include -I/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3 -I/home/junpinfoo/zephyrproject/zephyr/lib/open-amp/. -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/. -I/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/r5 -I/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include -I/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/. -I/home/junpinfoo/cmpt433/work/as4/R5/build/modules/libmetal/libmetal/lib/include -I/home/junpinfoo/zephyrproject/modules/lib/open-amp/open-amp/lib/include -isystem /home/junpinfoo/zephyrproject/zephyr/lib/libc/common/include

C_FLAGS = -Wshadow -fno-strict-aliasing -Os -imacros /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/include/generated/zephyr/autoconf.h -fno-common -g -gdwarf-4 -fdiagnostics-color=always -mcpu=cortex-r5+nofp.dp -mthumb -mabi=aapcs -mfpu=vfpv3xd -mfloat-abi=hard -mfp16-format=ieee -mtp=soft --sysroot=/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/arm-zephyr-eabi -imacros /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/zephyr_stdint.h -Wall -Wformat -Wformat-security -Wno-format-zero-length -Wdouble-promotion -Wno-pointer-sign -Wpointer-arith -Wexpansion-to-defined -Wno-unused-but-set-variable -Werror=implicit-int -fno-pic -fno-pie -fno-asynchronous-unwind-tables -ftls-model=local-exec -fno-reorder-functions --param=min-pagesize=0 -fno-defer-pop -fmacro-prefix-map=/home/junpinfoo/cmpt433/work/as4/R5=CMAKE_SOURCE_DIR -fmacro-prefix-map=/home/junpinfoo/zephyrproject/zephyr=ZEPHYR_BASE -fmacro-prefix-map=/home/junpinfoo/zephyrproject=WEST_TOPDIR -ffunction-sections -fdata-sections -specs=picolibc.specs -std=c99

