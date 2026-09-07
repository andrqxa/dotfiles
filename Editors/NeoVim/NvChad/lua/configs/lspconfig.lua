require("nvchad.configs.lspconfig").defaults()

-- gopls tuning (Neovim 0.11 vim.lsp.config API).
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        unusedwrite = true,
      },
      hints = {
        assignVariableTypes = true,
        constantValues = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
      },
    },
  },
})

-- clangd for C (Bootlin debugging labs, RPi2 sources). --query-driver is the flag that
-- matters when the tree is cross-compiled: it lets clangd ask the cross gcc for its own
-- system headers, instead of resolving every #include against the host's x86 ones.
-- Header insertion off: completion must not add includes to upstream kernel/buildroot files.
-- clangd still needs a compile_commands.json — `bear -- make` for the labs' plain
-- Makefiles, `scripts/clang-tools/gen_compile_commands.py` in a kernel tree.
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--query-driver=**/*gcc,**/*g++",
  },
})

local servers = { "html", "cssls", "gopls", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- The `hints`/`codelenses` settings above only make the server COMPUTE them;
-- the client side has to be switched on per buffer too. <leader>ih toggles
-- hints off again when they get noisy; <leader>cl runs the lens under cursor.
local lsp_extras = vim.api.nvim_create_augroup("user_lsp_extras", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_extras,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    if client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
    if client:supports_method "textDocument/codeLens" then
      vim.lsp.codelens.refresh { bufnr = args.buf }
    end
  end,
})

-- Keep codelenses current as the buffer changes.
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
  group = lsp_extras,
  callback = function(args)
    if #vim.lsp.get_clients { bufnr = args.buf, method = "textDocument/codeLens" } > 0 then
      vim.lsp.codelens.refresh { bufnr = args.buf }
    end
  end,
})
