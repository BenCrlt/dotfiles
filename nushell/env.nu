# env.nu
#
# Installed by:
# version = "0.112.2"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
#

let current_path = ($env | get --optional PATH | default [])
let normalized_path = if (($current_path | describe) == "string") {
    $current_path | split row (char esep)
} else {
    $current_path
}

$env.PATH = (
    [
        "/opt/homebrew/bin"
        "/opt/homebrew/sbin"
    ]
    | append $normalized_path
    | flatten
    | uniq
)
