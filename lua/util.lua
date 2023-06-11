local telescope = require('telescope.builtin')
local window = require('window')

local util = {}

function util.get_buffer_dir()
  local buffer_file_dir = vim.fn.expand('%:h')
  if buffer_file_dir then
    return buffer_file_dir
  else
    return vim.fn.getcwd()
  end
end

function util.command(command)
  if type(command) == "string" then
    return function()
      vim.cmd(command)
    end
  else
    return function()
      for _, command_str in ipairs(command) do
        vim.cmd(command_str)
      end
    end
  end
end

function util.split_command(command)
  return function()
    window.split(command)
  end
end

function util.buffer_picker()
  telescope.buffers {
    sort_lastused = true,
    sort_mru = true,
    ignore_current_buffer = true,
  }
end

function util.fuzzy_find_files()
  telescope.grep_string({
    command = 'rg',
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
    debounce = 250,
  })
end

function util.manage_files()
  print('bang')
end

return util
