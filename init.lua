vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.keymap.set("n","<leader>q", vim.cmd.wq)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "max397574/better-escape.nvim",
    lazy = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
  },
  {
    "mbbill/undotree"
  },
  {
    "tpope/vim-fugitive"
  }
}

opts = {

}

require("lazy").setup(plugins,opts)

require("tokyonight").setup({
  style = "night"
})
vim.cmd.colorscheme "tokyonight"

require("better_escape").setup()

local telescope_actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = telescope_actions.close
      },
    },
  }
})
local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n','<leader>ff',telescope_builtin.find_files,{})
vim.keymap.set('n','<leader>fg',telescope_builtin.live_grep,{})
vim.keymap.set('n','<leader>ft',telescope_builtin.colorscheme,{})

local TSconfig = require("nvim-treesitter.configs")
TSconfig.setup({
  ensure_installed = {
   "lua",
   "php"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

vim.keymap.set("n","<leader>u",vim.cmd.UndotreeToggle)

vim.keymap.set("n","<leader>g", vim.cmd.Git)