#shell qemu-system-arm -M lm3s6965evb --kernel bazel-bin/arm_c  --serial stdio -monitor null -nographic -gdb tcp::3333 -S

file bazel-bin/arm_c_rs
target remote localhost:3333
