load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "rules_rust",
    strip_prefix = "rules_rust-67adb4c03feeb30d9af0d56f65fa2c9071b5e9a4",
    sha256 = "a7862aa581240e2877a6d7fa4a78dc5fd06d008233be63621b44bf5a5a74dc03",
    urls = [
        # `main` branch as of 2022-01-24
        "https://github.com/bazelbuild/rules_rust/archive/67adb4c03feeb30d9af0d56f65fa2c9071b5e9a4.tar.gz",
    ],
)

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
    ],
    sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
)

load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")

rust_repository_set(
    name = "rust_linux_x86_64",
    exec_triple = "x86_64-unknown-linux-gnu",
    extra_target_triples = [
        "thumbv7m-none-eabi",
    ],
    version = "1.54.0",
)

http_archive(
    name = "arm_none_eabi_linux_x86_64",
    build_file = "//toolchain:arm_none_eabi_linux_x86_64.BUILD",
    sha256 = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3",
    strip_prefix = "gcc-arm-none-eabi-10.3-2021.10",
    url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2",
    
)

register_toolchains(
    "//toolchain:cc-toolchain-arm",
    "//toolchain:rust_linux_x86_64",
)