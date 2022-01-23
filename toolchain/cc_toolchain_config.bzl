load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path", "feature", "flag_group", "flag_set")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

all_link_actions = [ # NEW
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [ # NEW
        tool_path(
            name = "gcc",
            path = "linux_x86_64/arm-none-eabi-gcc",
        ),
        tool_path(
            name = "ld",
            path = "linux_x86_64/arm-none-eabi-gcc",
        ),
        tool_path(
            name = "ar",
            path = "linux_x86_64/arm-none-eabi-ar",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
        ),
    ]

    gcc_repo = "arm_none_eabi_linux_x86_64"
    gcc_version = "10.3.1"

    include_flags = [
        "-isystem",
        "external/{}/arm-none-eabi/include".format(gcc_repo),
        "-isystem",
        "external/{}/lib/gcc/arm-none-eabi/{}/include".format(gcc_repo, gcc_version),
        "-isystem",
        "external/{}/lib/gcc/arm-none-eabi/{}/include-fixed".format(gcc_repo, gcc_version),
        "-isystem",
        "external/{}/arm-none-eabi/include/c++/{}/".format(gcc_repo, gcc_version),
        "-isystem",
        "external/{}/arm-none-eabi/include/c++/{}/arm-none-eabi/".format(gcc_repo, gcc_version),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "arm",
        target_libc = "unknown",
        compiler = "arm-none-eabi-gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths, # NEW
        cxx_builtin_include_directories = [ # NEW
        ],


        # https://docs.bazel.build/versions/3.2.0/tutorial/cc-toolchain-config.html
        features=[
         feature(
             name = "default_linker_flags",
             enabled = True,
             flag_sets = [
                 flag_set(
                     actions = all_link_actions,
                     flag_groups = ([
                         flag_group(
                             flags = [
                                 "--specs=nosys.specs",
                                 "-mthumb",
                                 "-march=armv7",
                                 "-mfix-cortex-m3-ldrd",
                             ],
                         ),
                     ]),
                 ),
                 flag_set(
                     actions = [ACTION_NAMES.cpp_compile, ACTION_NAMES.c_compile],
                     flag_groups = ([
                         flag_group(
                             flags = [
                                 "-mthumb",
                                 "-march=armv7",
                                 "-mfix-cortex-m3-ldrd",
                                 "-fno-exceptions",
                                 "-g",
                             ],
                         ),
                        flag_group(flags = include_flags),
                     ]),
                 ),
             ],
         ),
        ]
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)

