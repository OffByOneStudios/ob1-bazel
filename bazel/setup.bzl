
load("@com_github_zaucy_rules_7zip//:setup.bzl", "setup_7zip")
load("@com_github_zaucy_rules_vulkan//:repo.bzl", "vulkan_repos")

def ob1_setup():
    setup_7zip()
    vulkan_repos()
