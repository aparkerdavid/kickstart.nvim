return {
	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',
	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help indent_blankline.txt`
	opts = {
		char = '┊',
		show_trailing_blankline_indent = false,
	},
	config = function()
		require("indent_blankline").setup {
			-- for example, context is off by default, use this to turn it on
			show_current_context = true,
		}
	end
}
