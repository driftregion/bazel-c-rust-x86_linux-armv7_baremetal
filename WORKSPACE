load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# http_archive(
#     name = "rules_rust",
#     sha256 = "531bdd470728b61ce41cf7604dc4f9a115983e455d46ac1d0c1632f613ab9fc3",
#     strip_prefix = "rules_rust-d8238877c0e552639d3e057aadd6bfcf37592408",
#     urls = [
#         # `main` branch as of 2021-08-23
#         "https://github.com/bazelbuild/rules_rust/archive/d8238877c0e552639d3e057aadd6bfcf37592408.tar.gz",
#     ],
# )

git_repository(
    name="rules_rust",
    commit="bd364c7f7a27a87dc42d54da660a8dd75e2ba26e",
    remote="https://github.com/driftregion/rules_rust",
    shallow_since = "1642862623 +0800",
)

load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
    ],
    sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
)

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