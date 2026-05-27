# config.nu
#
# Installed by:
# version = "0.112.2"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#
$env.config.buffer_editor = "nvim"

const autoload_dir = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload_dir

const starship_autoload = ($autoload_dir | path join "starship.nu")
if not ($starship_autoload | path exists) {
    starship init nu | save -f $starship_autoload
}

const zoxide_autoload = ($autoload_dir | path join "zoxide.nu")
if not ($zoxide_autoload | path exists) {
    zoxide init nushell | save -f $zoxide_autoload
}

let zoxide_hooked = ($env | get --optional __zoxide_hooked)
if (($zoxide_hooked | describe) == "string") {
    hide-env __zoxide_hooked
}
source $zoxide_autoload
const aliases_file = ($nu.config-path | path dirname | path join "aliases.nu")
source $aliases_file
