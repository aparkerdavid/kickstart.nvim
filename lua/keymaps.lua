local keys = require('which-key')
local telescope = require('telescope.builtin')
local telescope_project = require('telescope').extensions.projects
local lf = require('lf')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '$', '$l') -- modified $ for virutaledit=onemore

local function cmd(command)
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

local function buffer_picker()
  telescope.buffers {
    sort_lastused = true,
    sort_mru = true,
    ignore_current_buffer = true,
  }
end

keys.register({
    ['?'] = { telescope.oldfiles, 'recent files' },
    ['/'] = { telescope.current_buffer_fuzzy_find, 'find line' },
    h = { telescope.help_tags, 'help' },
    f = {
      name = 'file',
      g = { telescope.git_files, 'git files' },
      f = { lf.start, 'file manager' },
      s = { cmd 'w', 'save' },
    },
    b = {
      name = 'buffer',
      b = { buffer_picker, 'switch' },
      d = { cmd 'bd!', 'delete' },
      f = { cmd 'Format', 'format' },
    },
    d = {
      name = 'diagnostics',
      s = { telescope.diagnostics, 'search diagnostics' },
      d = { vim.diagnostic.open_float, 'view diagnostic' },
      l = { vim.diagnostic.setloclist, 'view diagnostic list' },
      k = { vim.diagnostic.goto_prev, 'previous diagnostic' },
      j = { vim.diagnostic.goto_next, 'next diagnostic' },
    },
    s = {
      name = 'search',
      s = { telescope.live_grep, 'grep' },
      w = { telescope.grep_string, 'grep word' },
    },
    w = {
      name = 'window',
      d = { cmd 'close', 'close' },
      h = { cmd 'wincmd h', 'right' },
      j = { cmd 'wincmd j', 'down' },
      k = { cmd 'wincmd k', 'up' },
      l = { cmd 'wincmd l', 'left' },
      H = { cmd 'vsplit', 'split left' },
      J = { cmd { 'split', 'wincmd j' }, 'split below' },
      K = { cmd 'split', 'split above' },
      L = { cmd { 'vsplit', 'wincmd l' }, 'split right' },
    },
    g = {
      name = 'git',
      g = { cmd 'Git', 'fugitive' },
      k = { require('gitsigns').prev_hunk, 'previous hunk' },
      j = { require('gitsigns').next_hunk, 'next hunk' },
      p = { require('gitsigns').preview_hunk, 'preview hunk' },
    },
    p = { telescope_project.projects, 'project' },
  },
  { prefix = "<leader>" })
