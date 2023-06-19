vim.cmd.tnoremap('<ESC>', '<C-\\><C-n>')
vim.cmd.tnoremap('<ESC><ESC>', '<ESC>')
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber") -- no numbers

local window = require 'window'

local terminal = {}

function terminal.new()
  if window.is_wide() then
    vim.cmd('vsplit')
  else
    vim.cmd('split')
  end

  vim.cmd('term')
end

return terminal
