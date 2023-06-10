# Neovim Config

## What is this ?

This is my neovim config file, this is not a gist because this file might be
splitted into multiple files also, i found easier to explain code without lots of comments

### Dependencies

- curl 
- unzip
- wget
- gzip 
- git
- rust
- go
- lua5.x
- nodejs (16+)
- ripgrep
- fd-find


### Installation

1 - Installing package managaer

```bash
 git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```
> see more about packer [here](https://github.com/wbthomason/packer.nvim)

2 - Open neovim and install packer plugins (see packer plugins below)

```bash
:PackerInstall
 ```
after installing Packer plugins close the editor and open it again, treesitter will install all your parser from "ensure_installed" list

3 - Install LSP for your languajes

using [Mason](mason link) to install all of your lsp by running


```bash
:MasonInstall <your lsp>
 ```

#### Example 

```bash
:MasonInstall css_lsp rust_analyzer lua-language-server vue-language-server typescript-language-server
 ```

 > you can install more than by by separate with spaces


### LSP used in this config

- cssls
- tsserver
- vue-language-server (volar) 
- lua_ls
- rust_analyzer

### Packer Plugins

- "wbthomason/packer.nvim"
- "rcarriga/nvim-notify"
- "MunifTanjim/prettier.nvim"
- "lukas-reineke/lsp-format.nvim"
- "jose-elias-alvarez/null-ls.nvim"
- "editorconfig/editorconfig-vim"
- "nvim-treesitter/nvim-treesitter"
- "rafamadriz/friendly-snippets"
- "nvim-lua/plenary.nvim"
- "catppuccin/nvim"
- "nvim-telescope/telescope.nvim"
- "kyazdani42/nvim-web-devicons"
- "tzachar/cmp-tabnine"
- "windwp/nvim-autopairs"
- "nvim-lua/popup.nvim"
- "williamboman/mason.nvim"
- "williamboman/mason-lspconfig.nvim"
- "kyazdani42/nvim-tree.lua"
- "folke/lsp-colors.nvim"
- "nvim-treesitter/nvim-treesitter-textobjects"
- "lewis6991/gitsigns.nvim"
- "akinsho/flutter-tools.nvim"
- "neovim/nvim-lspconfig"
- "onsails/lspkind-nvim"
- "hrsh7th/nvim-cmp"
- "hrsh7th/cmp-nvim-lsp"
- "saadparwaiz1/cmp_luasnip"
- "L3MON4D3/LuaSnip"
- "nvim-lualine/lualine.nvim"
- "folke/trouble.nvim"
