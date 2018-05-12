proto_library(
    name = "a_proto",
    srcs = ["a.proto"],
)

cc_proto_library(
    name = "a_cc_proto",
    deps = [":a_proto"],
)


cc_binary(
    name = "fib",
    srcs = ["main.cpp"],
    linkstatic = 1,
    deps = [
     "@com_github_01org_tbb//:tbb",

     ":a_cc_proto",
    ],
)
