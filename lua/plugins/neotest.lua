return {
	'nvim-neotest/neotest',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'antoinemadec/FixCursorHold.nvim',
		'jfpedroza/neotest-elixir',
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-elixir')({
					args = { '--trace' }
				}),
			}
		})
	end
}
