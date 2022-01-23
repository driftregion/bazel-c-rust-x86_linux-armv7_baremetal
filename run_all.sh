#! /usr/bin/env bash

bazel run //:linux_c_c
bazel run //:linux_c_rs
bazel run //:linux_rs_c
bazel run --config=qemu //:arm_c_c
bazel run --config=qemu //:arm_c_rs