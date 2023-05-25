return {
	"lmburns/lf.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
	init = function()
		vim.g.lf_netrw = true
	end
}
