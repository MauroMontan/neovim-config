-- packer
require("packer").startup(function(use)
  use "rebelot/kanagawa.nvim"
  use("wbthomason/packer.nvim") -- Package manager
  use "lukas-reineke/lsp-format.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use 'editorconfig/editorconfig-vim'
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use "rafamadriz/friendly-snippets"
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use 'nvim-tree/nvim-web-devicons'
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use("kyazdani42/nvim-web-devicons")
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use("windwp/nvim-autopairs")
  use("nvim-lua/popup.nvim")
  use({ "williamboman/mason.nvim" })
  use { "catppuccin/nvim", as = "catppuccin" }
  use("williamboman/mason-lspconfig.nvim")
  use("kyazdani42/nvim-tree.lua")
  use 'folke/lsp-colors.nvim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use({ "lewis6991/gitsigns.nvim" })
  use { 'akinsho/flutter-tools.nvim' }
  use("neovim/nvim-lspconfig")
  use("onsails/lspkind-nvim")
  use("hrsh7th/nvim-cmp")         -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp")     -- LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip")         -- Snippets plugin
  use 'nvim-lualine/lualine.nvim'
  use("folke/trouble.nvim")
end)



-- lsp format setup
require("lsp-format").setup {

  on_attach = function(client)
    vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
  end,

  file_ignore_patterns = {
    "css"
  },
}


-- color scheme
vim.cmd.syntax('on')

--vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd("colorscheme kanagawa-dragon")


-- init auopairs
require('nvim-autopairs').setup {}


-- Gui
vim.o.termguicolors = true
vim.o.fillchars = "vert:,horiz:━,eob: "
vim.o.ls = 0
vim.o.ch = 0
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
--vim.o.completeopt = "menuone,noselect"
vim.o.updatetime = 250
vim.o.breakindent = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true


-- Lua line
require('lualine').setup({
  options = {
    globalstatus = false,
    ignore_focus = {
      "NvimTree"
    },
  }
})

-- Tab config

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Navigation

local customKeymap = vim.api.nvim_set_keymap
local custom_opts = { noremap = true }

customKeymap("n", "<c-j>", "<c-w>j", custom_opts)
customKeymap("n", "<c-h>", "<c-w>h", custom_opts)
customKeymap("n", "<c-k>", "<c-w>k", custom_opts)
customKeymap("n", "<c-l>", "<c-w>l", custom_opts)

-- Shortcuts

--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Actions

customKeymap("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
customKeymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
customKeymap("n", "<c-s>", "<cmd>w<cr>", { noremap = true, silent = true })
customKeymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
customKeymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
customKeymap("n", "<space>d", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
customKeymap("n", "<space>e", "<cmd>:NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Telescope mappings
vim.keymap.set("n", "<leader>f", ":Telescope fd hidden=true<cr>")
vim.keymap.set("n", "fc", ":Telescope flutter commands<cr>")
vim.keymap.set("n", "<leader><space>", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>sp", ":Telescope live_grep <cr>")

--  Trouble
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Lsp colors

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#ff0000",
  Information = "#0db9d7",
  Hint = "#10B981"
})


-- gitsigns
require("gitsigns").setup({

  signs = {
    add          = { text = '+' },
    change       = { text = '|' },
    delete       = { text = '_' },
    topdelete    = { text = '#' },
    changedelete = { text = '~' },
    untracked    = { text = ' ' },
  },

})

-- NVIM tree
require("nvim-tree").setup({
  view = {
    side = "right",
  },
})


-- Completition

local lspkind = require("lspkind")


-- luasnip setup


require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require "luasnip".lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = cmp.config.sources({
    { name = 'luasnip',    option = { show_autosnippets = true } },
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol hello', -- show only symbol annotations
      --	maxwidth = 250,     -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function(entry, vim_item)
        if entry.source.name == 'nvim_lsp' then
          vim_item.dup = 0
        end
        return vim_item
      end
    })
  }

}

-- LSP config

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})



local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- LSP setup by language
local lsp = require("lspconfig")

lsp.gopls.setup {
  capabilities = capabilities
}

-- CSS LSP
--
lsp.cssls.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  single_file_support = true,
  filetypes = {
    "css"
  }
}


-- TYPESCRIPT LSP
lsp.tsserver.setup {

  on_attach = function(client)
    require("lsp-format").on_attach(client)
  end,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  single_file_support = true,
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
    "json"
  }
}


-- C++
lsp.clangd.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities
}

-- VUE LSP
lsp.volar.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  filetypes = { 'vue' }

}

-- go

require 'lspconfig'.gopls.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
}

-- python
lsp.pyright.setup {

  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
}


-- Astro
lsp.astro.setup {

  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
}


-- LUA LSP
lsp.lua_ls.setup {

  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
}



lsp.jdtls.setup {

  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  filetypes = { "java" },
}

-- RUST LSP
lsp.rust_analyzer.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}


-- Treesitter

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "c", "lua", "rust", "cpp", "swift", "python", "ruby", "dart", "bash", "java"
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  -- List of parsers to ignore installing (for "all")
  ignore_install = { "vue" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
})

-- Telescope settings
require("telescope").setup({
  defaults = {
    show_preview = false,
    file_ignore_patterns = {
      "ios/", "build/", "node_modules/", ".git/", ".dart_tool/", ".idea/", "macos/", "**.class"
    },
  },
  extensions = {
  },
})

-- Telescope extensions


require("telescope").load_extension("flutter")
require("flutter-tools").setup() -- use defaults
