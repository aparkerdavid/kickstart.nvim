local function light_theme()
	vim.api.nvim_set_option('background', 'light')
	vim.cmd('colorscheme zenbones')
	require('lualine').setup { options = { theme = 'zenbones' } }
end

local function dark_theme()
	vim.api.nvim_set_option('background', 'dark')
	vim.cmd('colorscheme zenwritten')
	require('lualine').setup { options = { theme = 'zenwritten' } }

	local lush = require('lush')
	local zenwritten = require('zenwritten')

	local spec = lush.extends({ zenwritten }).with(function()
		return { Visual { bg = "#001752" } }
	end)

	lush(spec)
end

return {
	'f-person/auto-dark-mode.nvim',
	config = function()
		local auto_dark_mode = require('auto-dark-mode')

		auto_dark_mode.setup({
			update_interval = 1000,
			set_dark_mode = dark_theme,
			set_light_mode = light_theme,
		})
		auto_dark_mode.init()
	end
}
