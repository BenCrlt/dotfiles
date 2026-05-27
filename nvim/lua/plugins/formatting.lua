local function prettier_cwd(_, ctx)
  local config_path = vim.fn.system({ "prettier", "--find-config-path", ctx.filename })

  if vim.v.shell_error == 0 then
    config_path = vim.trim(config_path)
    if config_path ~= "" then
      return vim.fs.dirname(config_path)
    end
  end

  return vim.fs.root(ctx.dirname, { "package.json", ".git" })
end

return {
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = opts.formatters.prettier or {}
      opts.formatters.prettier.cwd = prettier_cwd
    end,
  },
}
