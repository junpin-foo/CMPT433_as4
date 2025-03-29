
# Consider dependencies only in project.
set(CMAKE_DEPENDS_IN_PROJECT_ONLY OFF)

# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/__aeabi_read_tp.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/__aeabi_read_tp.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/cpu_idle.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/cpu_idle.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/exc.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/exc.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/exc_exit.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/exc_exit.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/isr_wrapper.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/isr_wrapper.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/reset.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/reset.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/swap_helper.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/swap_helper.S.obj"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/vector_table.S" "/home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/vector_table.S.obj"
  )
set(CMAKE_ASM_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "KERNEL"
  "K_HEAP_MEM_POOL_SIZE=0"
  "PICOLIBC_DOUBLE_PRINTF_SCANF"
  "__LINUX_ERRNO_EXTENSIONS__"
  "__PROGRAM_START"
  "__ZEPHYR_SUPERVISOR__"
  "__ZEPHYR__=1"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "/home/junpinfoo/zephyrproject/zephyr/kernel/include"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/include"
  "zephyr/include/generated/zephyr"
  "/home/junpinfoo/zephyrproject/zephyr/include"
  "zephyr/include/generated"
  "/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3"
  "/home/junpinfoo/zephyrproject/zephyr/lib/open-amp/."
  "/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/."
  "/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/r5"
  "/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include"
  "/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/."
  "modules/libmetal/libmetal/lib/include"
  "/home/junpinfoo/zephyrproject/modules/lib/open-amp/open-amp/lib/include"
  "/home/junpinfoo/zephyrproject/zephyr/lib/libc/common/include"
  )

# The set of dependency files which are needed:
set(CMAKE_DEPENDS_DEPENDENCY_FILES
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/fault.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/fault.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/fault.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/irq_init.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/irq_init.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/irq_init.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/irq_manage.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/irq_manage.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/irq_manage.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/prep_c.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/prep_c.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/prep_c.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/reboot.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/reboot.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/reboot.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/smp.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/smp.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/smp.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/stacks.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/stacks.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/stacks.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/tcm.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/tcm.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/tcm.c.obj.d"
  "/home/junpinfoo/zephyrproject/zephyr/arch/arm/core/cortex_a_r/thread.c" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/thread.c.obj" "gcc" "zephyr/arch/arch/arm/core/cortex_a_r/CMakeFiles/arch__arm__core__cortex_a_r.dir/thread.c.obj.d"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
