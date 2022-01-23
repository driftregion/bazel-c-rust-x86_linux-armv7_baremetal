package(default_visibility = ["//visibility:public"])
load(":cc_toolchain_config.bzl", "cc_toolchain_config")
load('@rules_rust//rust:toolchain.bzl', 'rust_toolchain')

filegroup(name = "empty")

cc_toolchain_config(name = "arm_toolchain_config")

cc_toolchain(
    name = "cc-compiler-arm",
    toolchain_identifier = "cc-compiler-arm",
    toolchain_config = ":arm_toolchain_config",
    all_files = "//toolchain/linux_x86_64:all_files",
    ar_files = "//toolchain/linux_x86_64:ar_files",
    compiler_files = "//toolchain/linux_x86_64:compiler_files",
    dwp_files = ":empty",
    linker_files = "//toolchain/linux_x86_64:linker_files",
    objcopy_files = "//toolchain/linux_x86_64:objcopy_files",
    strip_files = ":empty",
    supports_param_files = 0,
)

toolchain(
    name = "cc-toolchain-arm",
    target_compatible_with = [
        "@platforms//cpu:armv7-m",
        "@platforms//os:none"
    ],
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    toolchain = ":cc-compiler-arm",
    # toolchain_type= ":toolchain_type",
    toolchain_type= "@bazel_tools//tools/cpp:toolchain_type",
)


cc_toolchain_suite(
    name = "arm_suite",
    toolchains = {
        "arm": ":cc-compiler-arm",
        "k8": ":cc-compiler-arm"
    },
)

rust_toolchain(
    name = "rust_linux_x86_64_impl",
    rustc = "@rust_linux_x86_64//:rustc",
    rustc_lib = "@rust_linux_x86_64//:rustc_lib",
    # rust_lib = "@rust_linux_x86_64//:rust_lib",
    rust_lib = "@rust_linux_x86_64//:rust_lib-x86_64-unknown-linux-gnu",
    rust_doc = "@rust_linux_x86_64//:rustdoc",
    binary_ext = "",
    staticlib_ext = ".a",
    dylib_ext = ".so",
    # stdlib_linkflags = ["-lpthread", "-ldl"],
    stdlib_linkflags = [],
    os = "linux",
    target_triple="thumbv7m-none-eabi",
)

toolchain(
    name = "rust_linux_x86_64",
    target_compatible_with = [
        "@platforms//cpu:armv7-m",
        "@platforms//os:none"
    ],
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    toolchain = ":rust_linux_x86_64_impl",
    toolchain_type= "@rules_rust//rust:toolchain",
)
