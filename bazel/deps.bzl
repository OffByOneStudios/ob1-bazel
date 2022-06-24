load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def ob1_deps():
    if "spdlog" not in native.existing_rules():
        git_repository(
            name = "spdlog",
            commit = "d853f44b345d752538c5e3cd8c5f68e9f45e6806",
            remote = "https://github.com/cgrinker/spdlog",
            shallow_since = "1611099882 -0800",
        )
        
    if "yaml-cpp" not in native.existing_rules():
        # Note: Official source
        git_repository(
            name = "yaml-cpp",
            commit = "a6bbe0e50ac4074f0b9b44188c28cf00caf1a723",  # master (past v0.6.3)
            remote = "https://github.com/jbeder/yaml-cpp",
            shallow_since = "1609854028 -0600",
        )

    if "yoga" not in native.existing_rules():
        http_archive(
            name = "yoga",
            urls = ["https://github.com/cgrinker/yoga/archive/5cd6256843499537f1ae65eaa92c7376be22e99e.zip"],
            strip_prefix = "yoga-5cd6256843499537f1ae65eaa92c7376be22e99e",
            #sha256 = "",
        )
    
    if "flecs" not in native.existing_rules():
        # Note: Official source
        git_repository(
            name = "flecs",
            commit = "f150d96ba9ea8be2b24dbf2217368c231cb17720",  # v2.3.2
            remote = "https://github.com/SanderMertens/flecs",
            shallow_since = "1615075784 -0800",
        )
        
    if "glm" not in native.existing_rules():
        new_git_repository(
            name = "glm",
            build_file  = "@ninja_ob1_bazel//:libs/glm.BUILD.bazel",
            commit = "ace16e47780dcef815294715237f51e9129b6eb3",  #v0.9.9.8
            remote = "https://github.com/g-truc/glm",
            shallow_since = "1615197695 +0100",
        )

    if "graphqlparser" not in native.existing_rules():
        http_archive(
            name = "graphqlparser",
            urls = ["https://github.com/graphql/libgraphqlparser/archive/refs/tags/v0.7.0.zip"],
            strip_prefix = "libgraphqlparser-0.7.0",
            build_file  = "@ninja_ob1_bazel//:libs/graphqlparser.BUILD.bazel",
            sha256 = "1fa4a7df16bdf407de35f47dc69bd73ed39cd302e55ea620bde7b228a9fd7250",
        )

    if "glfw" not in native.existing_rules():
        http_archive(
            name = "glfw",
            urls = ["https://github.com/mason-bially/glfw/archive/52e7f2221fbadeeab89f093e2d25e9f314a8c431.zip"],
            strip_prefix = "glfw-52e7f2221fbadeeab89f093e2d25e9f314a8c431",
            sha256 = "832936e750fc23beaba91106beb9949c1b294ebd386c9962cf6c5da7098c613c",
        )
    
    if "sdl2" not in native.existing_rules():
        git_repository(
            name = "sdl2",
            commit = "e7107899bbcffd513c08ef3e3a02a7cd5ca3d04d",  # v??
            remote = "https://github.com/mason-bially/sdl2",
            shallow_since = "1609533063 -0800",
        )

    if "skia" not in native.existing_rules():
        http_archive(
            name = "skia",
            urls = ["https://github.com/OffByOneStudios/bazel-skia/releases/download/v0.1.0/skia.zip"],
            strip_prefix = "skia",
            sha256 = "3b8b284238d931eaf78da263600367c699216060d85d9d05042e3845b5082ab4",
        )

    if "sqlite" not in native.existing_rules():
        http_archive(
            name = "sqlite3",
            urls= ["https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip"],
            strip_prefix="sqlite-amalgamation-3370200",
            build_file  = "@ninja_ob1_bazel//:libs/sqlite3.BUILD.bazel",
            sha256 = "cb25df0fb90b77be6660f6ace641bbea88f3d0441110d394ce418f35f7561bb0",
        )
    
    if "com_github_zaucy_rules_7zip" not in native.existing_rules():
        git_repository(
            name = "com_github_zaucy_rules_7zip",
            commit = "e95ba876db445cf2c925c02c4bc18ed37a503fd8",
            remote = "https://github.com/zaucy/rules_7zip",
            shallow_since = "1566118921 -0700",
        )

    if "com_github_zaucy_rules_vulkan" not in native.existing_rules():
        git_repository(
            name = "com_github_zaucy_rules_vulkan",
            commit = "acddbad61190b7faf81c5ee27e23d259d3c6a1ed",
            remote = "https://github.com/mason-bially/rules_vulkan",
            shallow_since = "1656102899 -0700"
        )
        