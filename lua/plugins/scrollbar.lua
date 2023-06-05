return {
	'petertriho/nvim-scrollbar',
	dependencies = { 'lewis6991/gitsigns.nvim' },
	config = function()
		require("scrollbar").setup({
			handle = {
				blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
			},
			handlers = {
				cursor = false,
				gitsigns = true,
			},
		})
	end
}
