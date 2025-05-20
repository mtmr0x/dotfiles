-- got it from https://github.com/Rishabh672003/Neovim

-- Create keybindings, commands, inlay hints and autocommands on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    ---@diagnostic disable-next-line need-check-nil
    --if client.server_capabilities.completionProvider then
    --  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    --  -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    --end
    ---@diagnostic disable-next-line need-check-nil
    -- if client.server_capabilities.definitionProvider then
    --   vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    -- end

    -- -- nightly has inbuilt completions, this can replace all completion plugins
    -- if client.supports_method("textDocument/completion") then
    --   -- Enable auto-completion
    --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    -- end

    --- Disable semantic tokens
    ---@diagnostic disable-next-line need-check-nil
    client.server_capabilities.semanticTokensProvider = nil

    -- All the keymaps
    -- stylua: ignore start
    local keymap = vim.keymap.set
    local lsp = vim.lsp.buf
    local opts = { silent = true, buffer = true }
    local function opt(desc, others)
      return vim.tbl_extend("force", opts, { desc = desc }, others or {})
    end

    keymap("n", "<Leader>ls", function() lsp.document_symbol() end, opt("Doument Symbols"))
    keymap("n", "<Leader>lS", function() lsp.workspace_symbol() end, opt("Workspace Symbols"))
    keymap("n", "gd", function() lsp.definition() end, opts)
    keymap("n", "gD", function() require("extras.definition").get_doc() end, opts)
    keymap("n", "gI", function() lsp.implementation()  end, opts)
    keymap("n", "gr", function() lsp.references() end, opts)
    keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>", opts)
    keymap("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opt("Code Action"))
    keymap("n", "<Leader>lf", "<Cmd>Format<CR>", opt("Format"))
    keymap("n", "<Leader>lF", "<Cmd>FormatToggle<CR>", opt("Toggle AutoFormat"))
    keymap("n", "<Leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end, opt("Toggle Inlayhints"))
    keymap("n", "<Leader>li", "<Cmd>checkhealth vim.lsp<CR>", opt("LspInfo"))
    keymap("n", "<Leader>lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opt("Next Diagnostic"))
    keymap("n", "<Leader>lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opt("Prev Diagnostic"))
    keymap("n", "<Leader>ll", "<Cmd>lua vim.lsp.codelens.run()<CR>", opt("Run CodeLens"))
    keymap("n", "<Leader>lq", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opt("Set LocList"))
    keymap("n", "<Leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opt("Rename"))
    -- stylua: ignore end
  end,
})
-- }}}
