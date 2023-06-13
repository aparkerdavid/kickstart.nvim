local theme = {}
function theme.light()
  vim.api.nvim_set_option('background', 'light')
  vim.cmd('colorscheme zenbones')
  require('lualine').setup { options = { theme = 'zenbones' } }
end

function theme.dark()
  vim.api.nvim_set_option('background', 'dark')
  vim.cmd('colorscheme zenwritten')

  local lush = require('lush')
  local zenwritten = require('zenwritten')

  local spec = lush.extends({ zenwritten }).with(function()
    return { Visual { bg = '#19274a' } }
  end)

  lush(spec)
  require('lualine').setup { options = { theme = 'zenwritten' } }
end

return theme
