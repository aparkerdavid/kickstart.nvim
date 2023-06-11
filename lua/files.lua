local telescope = require('telescope.builtin')
local util = require('util')
local files = {}

files.git = telescope.git_files
files.find = telescope.find_files
files.manage = function()
  local buffer_dir = util.get_buffer_dir()
  vim.cmd.e(buffer_dir)
end

return files
