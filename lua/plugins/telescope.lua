local function max_columns(_, max_columns) return max_columns end
local function max_lines(_, max_columns) return max_columns end

return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = "make",
			config = function()
				require('telescope').load_extension('fzf')
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
						width = max_columns,
						height = max_lines,
						preview_width = 0.62,
					}
				}
			},
		}
	end
}
