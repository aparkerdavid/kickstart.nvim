local theme = require 'theme'
return {
	'f-person/auto-dark-mode.nvim',
	config = function()
		local auto_dark_mode = require('auto-dark-mode')

		auto_dark_mode.setup({
			update_interval = 1000,
			set_dark_mode = theme.dark,
			set_light_mode = theme.light,
		})
		auto_dark_mode.init()
	end
}
