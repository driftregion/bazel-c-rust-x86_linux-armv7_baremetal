# bazel-c-rust-x86_linux-armv7_baremetal

Everyone knows you can [mix C and rust](https://docs.rust-embedded.org/book/interoperability/rust-with-c.html). Bazel shines at swapping compilation targets.

```
         ┌──────────────────────────────┐
         │                              │
         │    ┌────────────────┐    ┌───▼──────────┐
lib      │    │    c library   │    │  rust library│
         │    └──────▲───────▲─┘    └───▲──────────┘
         │           │       │          │
       ┌─┴───────────┴┐  ┌───┴──────────┴┐
main   │  rust main   │  │  c main       │
       └─────────────▲┘  └───▲──────────▲┘
                     │       │          │
                   ┌─┴───────┴───┐    ┌─┴────────────────┐
target             │linux x86_64 │    │ baremetal ARM CM3│
                   └─────────────┘    └──────────────────┘
```

| target | main | lib | command |
| - | - | - | - |
| x86_64-unknown-linux-gnu | c | c | `bazel run //:linux_c_c` |
| x86_64-unknown-linux-gnu | c | rust | `bazel run //:linux_c_rs` |
| x86_64-unknown-linux-gnu | rust | c | `bazel run //:linux_rs_c` |
| ARM Cortex M3 on QEMU (lm3s6965evb) | c | c | `bazel run --config=qemu //:arm_c_c` |
| ARM Cortex M3 on QEMU (lm3s6965evb) | c | rust | `bazel run --config=qemu //:arm_c_rs `|

### `x86_64-unknown-linux-gnu | c | c`
```
Hello from C compiled for x86_64 linux!
C library calculated squared(4) = 16
```

### `x86_64-unknown-linux-gnu | c | rust`
```
Hello from C compiled for x86_64 linux!
rust library calculated squared(4) = 16
```

### `x86_64-unknown-linux-gnu | rust | c`
```
Hello from rust compiled for linux on x86_64!
A C library calculated squared(4) = 16
```

### `ARM Cortex M3 on QEMU (lm3s6965evb) | c | c`
```
Hello from C compiled for baremetal ARM Cortex M3 on QEMU!
C library calculated squared(4) = 16
```

### `ARM Cortex M3 on QEMU (lm3s6965evb) | c | rust`
```
Hello from C compiled for baremetal ARM Cortex M3 on QEMU!
rust library calculated squared(4) = 16
```

# Acknowledgements

- https://github.com/hexdae/bazel-arm-none-eabi
- https://github.com/bazelbuild/rules_rust
- https://balau82.wordpress.com/2011/09/03/using-codesourcery-bare-metal-toolchain-for-cortex-m3/

If this is useful to you, please hit ⭐

# TODO:
- bindgen
- cargo dependencies
- clippy and IDE integration
