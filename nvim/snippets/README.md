# Custom snippets

These snippets are loaded by `blink.cmp` from `stdpath("config") .. "/snippets"`.

Add snippet files to `package.json`, then create or edit the matching JSON file.
Snippet bodies use VSCode snippet syntax:

- `$1`, `$2`, `$0` for jump positions.
- `${1:placeholder}` for editable placeholders.
- Built-in variables such as `$TM_FILENAME`, `$CURRENT_YEAR`, `$UUID`, and `$LINE_COMMENT`.

After editing snippets, restart Neovim or run `:Lazy reload blink.cmp`.
