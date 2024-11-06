-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.opt.ai = true -- auto ident
vim.opt.autoread = true
vim.opt.breakindent = true
vim.opt.cmdheight = 2
vim.opt.colorcolumn = "100" -- paint column 100th
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }
vim.opt.list = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.bo.softtabstop = 2
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 2
vim.opt.showbreak = "↪"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.si = true -- smart indent
vim.opt.smartcase = true
vim.opt.so = 7
vim.opt.wrap = true -- wrap lines

vim.keymap.set({'n'}, '<C-j>', '<C-W>j')
vim.keymap.set({'n'}, '<C-k>', '<C-W>k')
vim.keymap.set({'n'}, '<C-h>', '<C-W>h')
vim.keymap.set({'n'}, '<C-l>', '<C-W>l')
vim.keymap.set({'n'}, '<C-t>', ':Neotree<CR>')
vim.keymap.set({'n'}, '<C-p>', '<cmd>Telescope find_files<CR>')
vim.keymap.set({'n'}, '<C-f>', ':FZF<CR>')

-- clipboard functionality
vim.keymap.set({'n', 'x', 'v'}, '<leader>c', '"+y')
vim.keymap.set({'n', 'x', 'v'}, '<leader>v', '"+p')

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    -- theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- tools
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {"junegunn/fzf"},
    {"junegunn/fzf.vim"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"mhinz/vim-signify"},
    {"tpope/vim-fugitive"},
    {"github/copilot.vim"},
    {"hrsh7th/nvim-cmp"},
    {"dcampos/nvim-snippy"},
    {"dcampos/cmp-snippy"},
    {
      'romgrk/barbar.nvim',
      dependencies = {
	'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
	'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
	-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
	-- animation = true,
	-- insert_at_start = true,
	-- …etc.
      },
      version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",
	-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    },
    {"venantius/vim-cljfmt"},
    {"tpope/vim-fireplace"},
    {
      "neoclide/coc.nvim",
      init = function()
	-- run :call coc#util#install() when opening nvim
	vim.g.coc_global_extensions = {
	  'coc-conjure',
	}
      end,
    },

    -- languages
    {
      "Olical/conjure",
      ft = { "clojure", "fennel", "python" }, -- etc
      lazy = true,
      init = function()
	-- Set configuration options here
	-- Uncomment this to get verbose logging to help diagnose internal Conjure issues
	-- This is VERY helpful when reporting an issue with the project
	-- vim.g["conjure#debug"] = true
      end,

      -- Optional cmp-conjure integration
      dependencies = { "PaterJason/cmp-conjure" },
    },
    {
      "PaterJason/cmp-conjure",
      lazy = true,
      config = function()
	local cmp = require("cmp")
	local config = cmp.get_config()
	table.insert(config.sources, { name = "conjure" })
	return cmp.setup(config)
      end,
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { 
	"nvim-lua/plenary.nvim", 
	"neovim/nvim-lspconfig",
	"kyoh86/climbdir.nvim",
      },
      opts = {},
      lazy = false,
      config = function()
	require("typescript-tools").setup {
            on_attach = function(client)
                -- Disable document formatting capabilities
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            root_dir = function(path)
                local marker = require("climbdir.marker")
                -- Determine the root directory based on the presence of package.json or node_modules
                return require("climbdir").climb(path,
                    marker.one_of(marker.has_readable_file("package.json"), marker.has_directory("node_modules")), {
                        -- Stop the plugin if any of the specified files/folders are found
                        halt = marker.one_of(
                            marker.has_readable_file("deno.json"),
                            marker.has_readable_file("deno.jsonc"),
                            marker.has_readable_file("import_map.json"),
                            marker.has_directory("denops")
                        ),
                    })
            end,
            single_file_support = false,
        }
    end,
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
      "ray-x/go.nvim",
      dependencies = {  -- optional packages
	"ray-x/guihua.lua",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
      },
      config = function()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	require("go").setup({
	  lsp_cfg = {
	    capabilities = capabilities,
	  },
	})
	local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
	  pattern = "*.go",
	  callback = function()
	    require('go').setup({
	      lsp_cfg = {
		capabilities = capabilities,
	      },
	    })
	    require('go.format').goimports()
	  end,
	  group = format_sync_grp,
	})

      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
	"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
	"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
	-- { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
      },
      config = true
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "cattpuccino" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require('lualine').setup()

local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'conjure '},
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' },
    { name = 'path' },
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}

require("catppuccin").setup({
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
})

vim.cmd.colorscheme "catppuccin"

-- require("typescript-tools").setup {
--   settings = {
--     -- spawn additional tsserver instance to calculate diagnostics on it
--     separate_diagnostic_server = true,
--     -- "change"|"insert_leave" determine when the client asks the server about diagnostic
--     publish_diagnostic_on = "insert_leave",
--     -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
--     -- "remove_unused_imports"|"organize_imports") -- or string "all"
--     -- to include all supported code actions
--     -- specify commands exposed as code_actions
--     expose_as_code_action = {},
--     -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
--     -- not exists then standard path resolution strategy is applied
--     tsserver_path = nil,
--     -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
--     -- (see 💅 `styled-components` support section)
--     tsserver_plugins = {},
--     -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
--     -- memory limit in megabytes or "auto"(basically no limit)
--     tsserver_max_memory = "auto",
--     -- described below
--     tsserver_format_options = {},
--     tsserver_file_preferences = {},
--     -- locale of all tsserver messages, supported locales you can find here:
--     -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
--     tsserver_locale = "en",
--     -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
--     complete_function_calls = true,
--     include_completions_with_insert_text = true,
--     -- CodeLens
--     -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
--     -- possible values: ("off"|"all"|"implementations_only"|"references_only")
--     code_lens = "all",
--     -- by default code lenses are displayed on all referencable values and for some of you it can
--     -- be too much this option reduce count of them by removing member references from lenses
--     disable_member_code_lens = false,
--     -- JSXCloseTag
--     -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
--     -- that maybe have a conflict if enable this feature. )
--     jsx_close_tag = {
--       enable = true,
--       filetypes = { "javascriptreact", "typescriptreact" },
--     }
--   },
-- }

local nvim_lsp = require('lspconfig')
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "anthropic",
    },
    inline = {
      adapter = "anthropic",
    },
    agent = {
      adapter = "anthropic",
    },
  },
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
	env = {
	  api_key = "<API_KEY_FOR_ANTHROPIC>",
	},
      })
    end,
  },
})

-- setup treesitter
local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
  treesitter.setup({
    ensure_installed = {
      'c', 'cpp', 'go', 'lua', 
      'python', 'rust', 'tsx', 'typescript',
      'javascript', 'vim',
      'markdown', 'bash', 'html', 'css', 'fennel', 'clojure'
    },
    ignore_install = { "phpdoc", "norg" }, -- list of parser which cause issues or crashes
    highlight = { enable = true },
  })
end


  -----------------
  -- END OF FILE --
  -----------------
