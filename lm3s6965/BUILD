package(default_visibility = ["//visibility:public"])

cc_library(
    name="startup",
    srcs=[
        "startup_lm3s6965.S",
        "src/system_exit.c",
        "src/embedded-hal/console.c",
        "src/embedded-hal/delay.c",
        "src/system_lm3s.c",
        "inc/core_cmFunc.h",
        "inc/lm3s6965.h",
        "inc/embedded-hal/delay.h",
        "inc/embedded-hal/console.h",
        "inc/core_cm4.h",
        "inc/arm_math.h",
        "inc/core_cm3.h",
        "inc/system_lm3s.h",
        "inc/core_cm0plus.h",
        "inc/core_cmInstr.h",
        "inc/core_cm4_simd.h",
        "inc/arm_common_tables.h",
        "inc/arm_const_structs.h",
        "inc/core_sc000.h",
        "inc/core_cm0.h",
        "inc/core_sc300.h",
    ],
    copts=["-Ilm3s6965/inc", 
        "-fno-exceptions",
        "-g"
    ],
    deps = [
        ":lm3s6965.ld",
    ],
    # https://github.com/bazelbuild/rules_rust/issues/204
    linkopts=[
        "-T$(location :lm3s6965.ld)",
        "-Wl,--require-defined=_exit",
        "-Wl,--require-defined=_write",
    ],
    target_compatible_with = [
        "@platforms//cpu:armv7-m",
        "@platforms//os:none",
    ]
)
