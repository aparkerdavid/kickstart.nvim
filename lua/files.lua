local util = require('util')
local telescope = require('telescope.builtin')
local files = {}

function files.manage()
  util.command('e ' .. util.get_buffer_dir())
end

function files.git()
  telescope.git_files()
end

function files.find()
  telescope.find_files()
end

return files
