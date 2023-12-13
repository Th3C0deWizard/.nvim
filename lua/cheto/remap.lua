vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
-- horizontal and vertical splits
vim.keymap.set("n", "<S-|>", vim.cmd.split)
vim.keymap.set("n", "|", vim.cmd.vsplit)
-- Move between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
-- Close current buffer if there is no unsaved changes.
vim.keymap.set("n", "<leader>x", vim.cmd.bd)
-- Open a terminal instance in a new buffer
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
-- Enter normal mode of terminal buffer
vim.cmd(":tnoremap jj <C-\\><C-n>")
-- Open an external instance of alacrytty
vim.keymap.set("n", "<leader>te", "<Cmd>!alacritty &<CR><CR>")
