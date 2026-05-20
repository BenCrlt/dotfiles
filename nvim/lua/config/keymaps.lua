local function format_and_save()
  if vim.bo.modifiable and not vim.bo.readonly then
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ async = false, lsp_format = "fallback", timeout_ms = 3000 })
    else
      vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
    end
  end

  vim.cmd("silent! write")
end

vim.keymap.set({ "n", "i", "v" }, "<C-s>", format_and_save, { desc = "Format and save" })
