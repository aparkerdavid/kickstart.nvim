return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		}
	},
	config = function()
		-- [[ Configure Telescope ]]
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
				results_title = false,
				preview_title = false,
				title = false,
				border = false,
				layout_config = {
					horizontal = {
						width = function(_, max_columns)
							return max_columns
						end,
						height = function(_, _, max_lines)
							return max_lines
						end,
					}
				}
			},
		}
	end
}
