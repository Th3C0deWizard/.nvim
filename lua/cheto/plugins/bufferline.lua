return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})

		local function dontCloseNotSavedBuffers()
			local bufflineUi = require("bufferline.ui")

			local closeAllBufsExceptCurrent = function() -- delete all buffers, expect active one
				local rawBufArr = vim.api.nvim_list_bufs()
				local currBufNum = vim.api.nvim_get_current_buf()

				for _, value in ipairs(rawBufArr) do
					if
						value ~= currBufNum
						and vim.fn.buflisted(value)
						and not vim.api.nvim_buf_get_option(value, "modified")
					then
						vim.api.nvim_buf_delete(value, {})
					end
				end
			end

			closeAllBufsExceptCurrent()
			bufflineUi.refresh()
		end

		vim.keymap.set("n", "<leader>c", dontCloseNotSavedBuffers)
		vim.keymap.set("n", "<leader><Tab>", vim.cmd.BufferLineCycleNext)
	end,
}
