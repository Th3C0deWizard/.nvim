return {
	"sainnhe/sonokai",
	name = "sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("let g:sonokai_style = 'espresso'")
		vim.cmd("let g:sonokai_better_performance = 1")
		vim.cmd("colorscheme sonokai")
	end,
}
