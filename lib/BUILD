package(default_visibility = ["//visibility:public"])
load("@rules_rust//rust:defs.bzl", "rust_library")

cc_library(
    name="lib_h",
    srcs = ["lib.h"]
)

rust_library(
    name = "rs",
    srcs = [":lib.rs"],
    deps = [":lib_h"],
    # https://github.com/rust-lang/compiler-builtins/issues/79
    rustc_flags=["-O"]
)

cc_library(
    name = "c",
    srcs = [
        "lib.c",
        "lib.h"
    ]
)
