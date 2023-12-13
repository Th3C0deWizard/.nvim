return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				mappings = {
					n = {
						["q"] = actions.close,
					},
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					git_files = {
						hidden = true,
					},
					grep_string = {
						hidden = true,
					},
					live_grep = {
						hidden = true,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		vim.keymap.set(
			"n",
			"<leader>fw",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in cwd" }
		)
		-- keymap to file through all the files including .gitignore ones.

		vim.keymap.set("n", "<leader>f<S-f>", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "Fuzzy find files in cwd" })

		vim.keymap.set("n", "<leader>f<S-s>", function()
			builtin.live_grep({ no_ignore = true })
		end, { desc = "Find string in cwd" })

		vim.keymap.set("n", "<leader>f<S-w>", function()
			builtin.grep_string({ no_ignore = true })
		end, { desc = "Find string under cursor in cwd" })
	end,
}
