return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    { 'MunifTanjim/nui.nvim' }
  },
  config = function()
    local fine_cmd_utils = require("fine-cmdline").fn
    require("fine-cmdline").setup({
      hooks = {
        after_mount = function(input)
          vim.keymap.set('n', 'q', fine_cmd_utils.close, { buffer = input.bufnr })
        end
      }
    })
    vim.keymap.set("n", ":", vim.cmd.FineCmdline) 
  end
}
