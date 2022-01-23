load("@rules_rust//rust:defs.bzl", "rust_binary")

cc_binary(
    name="linux_c_c",
    srcs = ["main.c"],
    deps = ["//lib:c"],
    local_defines = ["HOST=\"\\\"x86_64 linux\\\"\""]
)

cc_binary(
    name="linux_c_rs",
    srcs = ["main.c"],
    deps = ["//lib:rs"],
    local_defines = ["HOST=\"\\\"x86_64 linux\\\"\""]
)

rust_binary(
    name = "linux_rs_c",
    srcs = ["main.rs"],
    deps = ["//lib:c"],
    crate_features = ["host_x86_64"]
)

platform(
    name = "qemu",
    constraint_values = [
        "@platforms//cpu:armv7-m",
        "@platforms//os:none"
    ],
)

cc_binary(
    name="arm_c_c",
    srcs=["main.c"],
    deps=[
        "//lm3s6965:startup",
        "//lib:c",
    ],
    local_defines = ["HOST=\"\\\"baremetal ARM Cortex M3 on QEMU\\\"\""]
)

cc_binary(
    name="arm_c_rs",
    srcs=["main.c"],
    deps=[
        "//lm3s6965:startup",
        "//lib:rs",
    ],
    local_defines = ["HOST=\"\\\"baremetal ARM Cortex M3 on QEMU\\\"\""]
)
