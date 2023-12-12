return { 
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local TSconfig = require("nvim-treesitter.configs")
    TSconfig.setup({
      ensure_installed = {
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
      autotag = {
        enable = true,
      }
    })
  end,
}
