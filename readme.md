# bazel-c-rust-x86_linux-armv7_baremetal

1. rust's memory safety is *nice*.
1. embedded software development is mostly C.
1. write new library code in rust and link it to C.


purpose: demonstrate a rust library that can be tested on a linux PC and deployed on a mostly-C baremetal device.


| host | main | lib | command |
| - | - | - | - |
| x86_64-unknown-linux-gnu | c | c | `bazel run //:linux_c_c` |
| x86_64-unknown-linux-gnu | c | rust | `bazel run //:linux_c_rs` |
| x86_64-unknown-linux-gnu | rust | c | `bazel run //:linux_rs_c` |
| ARM Cortex M3 on QEMU (lm3s6965evb) | c | c | `bazel run --config=qemu //:arm_c_c` |
| ARM Cortex M3 on QEMU (lm3s6965evb) | c | rust | `bazel run --config=qemu //:arm_c_rs `|


# Hey There

If this is useful to you, please hit ⭐


# Acknowledgements

- https://github.com/hexdae/bazel-arm-none-eabi


# TODO:
- bindgen
- cargo dependencies
- clippy and IDE integration