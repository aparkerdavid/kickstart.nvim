return {
	'stevearc/oil.nvim',
	config = function()
		require('oil').setup {
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
			trash_command = "trash",
			view_options = {
				show_hidden = true,
			}
		}
	end
}