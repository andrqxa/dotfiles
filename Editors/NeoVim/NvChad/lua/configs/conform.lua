local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- goimports = gofmt + import management (falls back to gopls via lsp_fallback)
    go = { "goimports" },
    -- C: on demand only (<leader>fm), see format_on_save below
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  -- Format on save everywhere EXCEPT C. The lab sources, the kernel and buildroot are
  -- upstream trees with their own style: a save would rewrite the whole file and bury
  -- the one line actually being debugged. <leader>fm still formats a C buffer by hand.
  format_on_save = function(bufnr)
    if vim.tbl_contains({ "c", "cpp" }, vim.bo[bufnr].filetype) then
      return nil
    end
    return { timeout_ms = 1000, lsp_fallback = true }
  end,
}

return options
