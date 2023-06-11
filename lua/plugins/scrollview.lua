return {
	'dstein64/nvim-scrollview',
	config = function()
		require('scrollview').setup({
			include_end_region = true,
			column = 1,
		})
	end
}
