vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "|", vim.cmd.vsplit)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<leader>t", "<Cmd>!alacritty &<CR><CR>")

