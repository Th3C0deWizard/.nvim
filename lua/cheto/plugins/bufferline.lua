return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})

		vim.keymap.set("n", "<leader>c", vim.cmd.BufferLineCloseOthers)
		vim.keymap.set("n", "<leader><Tab>", vim.cmd.BufferLineCycleNext)
	end,
}
