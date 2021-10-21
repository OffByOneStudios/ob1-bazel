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
            urls = ["https://github.com/mason-bially/skia-dist/archive/500838b97713b3c1c50d0e9e86d39878e48b0fb3.zip"],
            strip_prefix = "skia-dist-500838b97713b3c1c50d0e9e86d39878e48b0fb3",
            sha256 = "cd1c4e6db93423f07395bc9228e4729a8fc610b887db2aa5c2bf9412533aa6f7",
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
            commit = "84dea48b70b36cd20b631eeb96503766be37c258",
            remote = "https://github.com/mason-bially/rules_vulkan",
            shallow_since = "1625508886 -0700",
        )
        