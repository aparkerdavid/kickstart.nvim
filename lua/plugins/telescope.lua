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
				layout_strategy = 'bottom_pane',
				sorting_strategy = 'ascending',
				results_title = false,
				preview_title = false,
				title = false,
				layout_config = {
					height = 10,
				},
				border = true,
				borderchars = {
					prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
					results = { " " },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			},
		}
	end
}
