package(default_visibility = ['//visibility:public'])

# export the executable files to make them available for direct use.
exports_files(glob(["bin/*"]))

# gcc executables.
filegroup(
    name = "gcc",
    srcs = glob(["bin/arm-none-eabi-gcc*"]),
)

# ar executables.
filegroup(
    name = "ar",
    srcs = glob(["bin/arm-none-eabi-ar*"]),
)

# ld executables.
filegroup(
    name = "ld",
    srcs = glob(["bin/arm-none-eabi-ld*"]),
)

# nm executables.
filegroup(
    name = "nm",
    srcs = glob(["bin/arm-none-eabi-nm*"]),
)

# objcopy executables.
filegroup(
    name = "objcopy",
    srcs = glob(["bin/arm-none-eabi-objcopy*"]),
)

# objdump executables.
filegroup(
    name = "objdump",
    srcs = glob(["bin/arm-none-eabi-objdump*"]),
)

# strip executables.
filegroup(
    name = "strip",
    srcs = glob(["bin/arm-none-eabi-strip*"]),
)

# as executables.
filegroup(
    name = "as",
    srcs = glob(["bin/arm-none-eabi-as*"]),
)

# size executables.
filegroup(
    name = "size",
    srcs = glob(["bin/arm-none-eabi-size*"]),
)

# libraries and headers.
filegroup(
    name = "compiler_pieces",
    srcs = glob([
        "arm-none-eabi/**",
        "lib/gcc/arm-none-eabi/**",
    ]),
)

# collection of executables.
filegroup(
    name = "compiler_components",
    srcs = [
        ":ar",
        ":as",
        ":gcc",
        ":ld",
        ":nm",
        ":objcopy",
        ":objdump",
        ":strip",
    ],
)