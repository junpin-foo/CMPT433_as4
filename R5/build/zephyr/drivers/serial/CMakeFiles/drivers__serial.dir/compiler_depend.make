# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

zephyr/drivers/serial/CMakeFiles/drivers__serial.dir/uart_ns16550.c.obj: /home/junpinfoo/zephyrproject/zephyr/drivers/serial/uart_ns16550.c \
  zephyr/include/generated/zephyr/autoconf.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/zephyr_stdint.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/errno.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/cdefs.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/config.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/ieeefp.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/features.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/picolibc.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/float.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/_default_types.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/errno.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_includes.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stddef.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/types.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/stdint.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_intsup.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_stdint.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/limits.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/syslimits.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include-fixed/limits.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/gcc.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/common.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stdbool.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/linker/sections.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/linker/section_tags.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic_types.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_macro.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_loops.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_listify.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_is_eq.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_inc.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_dec.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_x2.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/__assert.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/time_units.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic_builtin.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/dlist.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/slist.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/list_gen.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sflist.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/obj_core.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_structs.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sys_heap.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mem_stats.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/structs.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/structs.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/stats.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/rb.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_version.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/syscall.h \
  zephyr/include/generated/zephyr/syscall_list.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stdarg.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/syscall.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/syscall.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/printk.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/inttypes.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/stdio.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_types.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/_types.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/cpu.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arch_interface.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq_offload.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arch_inlines.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/arch_inlines.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/lib_helpers.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/tpidruro.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/arch.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree.h \
  zephyr/include/generated/zephyr/devicetree_generated.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq_multilevel.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/io-channels.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/clocks.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/gpio.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/spi.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/dma.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/pwms.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/fixed-partitions.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/ordinals.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/pinctrl.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/can.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/reset.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/mbox.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/port-endpoint.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/thread.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/exception.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/exception.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/irq.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sw_isr_table.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/device.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/init.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/pm/state.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/device_mmio.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/mm.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/internal/mm.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mem_manage.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sys_io.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/iterable_sections.h \
  zephyr/include/generated/zephyr/syscalls/device.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing_syscall.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/error.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/misc.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/addr_types.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/ffs.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/nmi.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/asm_inline.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/asm_inline_gcc.h \
  /home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core.h \
  /home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core_a_r.h \
  /home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/r5/soc.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/interrupt_controller/intc_vim.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/dt-bindings/interrupt-controller/ti-vim.h \
  /home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/core_cr5.h \
  /home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/core_cr.h \
  /home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_compiler.h \
  /home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_gcc.h \
  /home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_cp15.h \
  /home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core_a_r_ext.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/cpu.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/sys_bitops.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/sys_io.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/barrier.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/barrier.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/timer.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/fatal_types.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys_clock.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/spinlock.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/fatal.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/exception.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/thread_stack.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/app_memory/mem_domain.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/thread.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/kobject.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/internal/kobject_internal.h \
  zephyr/include/generated/zephyr/kobj-types-enum.h \
  zephyr/include/generated/zephyr/syscalls/kobject.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/internal/smp.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing_macros.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/ring_buffer.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracking.h \
  zephyr/include/generated/zephyr/syscalls/kernel.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/uart.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/uart/uart_internal.h \
  zephyr/include/generated/zephyr/syscalls/uart.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/clock_control.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/pm/policy.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/pinctrl.h \
  /home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/pinctrl_soc.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/serial/uart_ns16550.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_instance.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_core.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_msg.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mpsc_packet.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/string.h \
  /home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/string.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_internal.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_cxx.h \
  /home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_enums.h \
  zephyr/include/generated/zephyr/syscalls/log_msg.h


/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_enums.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/string.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mpsc_packet.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_msg.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_core.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log.h:

/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/pinctrl_soc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/pm/policy.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/clock_control.h:

zephyr/include/generated/zephyr/syscalls/uart.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/uart.h:

zephyr/include/generated/zephyr/syscalls/kernel.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracking.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/ring_buffer.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing_macros.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/internal/smp.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/string.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/uart/uart_internal.h:

zephyr/include/generated/zephyr/kobj-types-enum.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/internal/kobject_internal.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/app_memory/mem_domain.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/thread_stack.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/fatal.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/spinlock.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys_clock.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/fatal_types.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/barrier.h:

zephyr/include/generated/zephyr/syscalls/log_msg.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/syscall.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic_types.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stdarg.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/syslimits.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sflist.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/asm_inline.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/slist.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/structs.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/dlist.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_cxx.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/nmi.h:

/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_gcc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic_builtin.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/init.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/__assert.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/_types.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mem_stats.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/logging/log_instance.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_dec.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/asm_inline_gcc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/serial/uart_ns16550.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_inc.h:

zephyr/include/generated/zephyr/syscalls/kobject.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_is_eq.h:

zephyr/include/generated/zephyr/syscall_list.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_loops.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq_offload.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/syscall.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/ieeefp.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/cpu.h:

/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core_a_r.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sys_heap.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_macro.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/pwms.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/time_units.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal_util_x2.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/zephyr_stdint.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/addr_types.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/dt-bindings/interrupt-controller/ti-vim.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/stats.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/exception.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_version.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/timer.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/gpio.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/linker/sections.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_listify.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/obj_core.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/irq_multilevel.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_includes.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/list_gen.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/config.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/exception.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel_structs.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_stdint.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/sys_io.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/util_internal.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/common.h:

zephyr/include/generated/zephyr/syscalls/device.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/lib_helpers.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/sys_bitops.h:

zephyr/include/generated/zephyr/autoconf.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stddef.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/errno.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/cdefs.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/float.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/stdint.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/machine/_default_types.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_intsup.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/types.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/limits.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/io-channels.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/mem_manage.h:

/home/junpinfoo/zephyrproject/zephyr/drivers/serial/uart_ns16550.c:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/linker/section_tags.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/syscall.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/printk.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/stdio.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/features.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/_types.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/structs.h:

zephyr/include/generated/zephyr/devicetree_generated.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/cpu.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include-fixed/limits.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arch_interface.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arch_inlines.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/sys_io.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/arch_inlines.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/kobject.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/tpidruro.h:

/home/junpinfoo/zephyrproject/zephyr/soc/ti/k3/am6x/r5/soc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/arch.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/inttypes.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/ordinals.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/clocks.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/spi.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/dma.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/misc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/fixed-partitions.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/pinctrl.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/can.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/reset.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/cbprintf_internal.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/thread.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/irq.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/thread.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sw_isr_table.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/sys/errno.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/port-endpoint.h:

/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_compiler.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/picolibc/include/picolibc.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/device_mmio.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/pm/state.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/mm.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/pinctrl.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/kernel/internal/mm.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/iterable_sections.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/cortex_a_r/exception.h:

/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/core_cr5.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/tracing/tracing_syscall.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/rb.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/arm/error.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/arch/common/ffs.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/atomic.h:

/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/drivers/interrupt_controller/intc_vim.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/toolchain/gcc.h:

/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/core_cr.h:

/home/junpinfoo/zephyrproject/modules/hal/cmsis/CMSIS/Core_R/Include/cmsis_cp15.h:

/home/junpinfoo/zephyr-sdk-0.17.0/arm-zephyr-eabi/lib/gcc/arm-zephyr-eabi/12.2.0/include/stdbool.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/devicetree/mbox.h:

/home/junpinfoo/zephyrproject/zephyr/modules/cmsis/cmsis_core_a_r_ext.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/device.h:

/home/junpinfoo/zephyrproject/zephyr/include/zephyr/sys/barrier.h:
