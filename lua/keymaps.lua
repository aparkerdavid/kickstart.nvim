local keys = require('which-key')
local gitsigns = require('gitsigns')
local telescope = require('telescope.builtin')
local u = require('util')
local cmd = u.cmd

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<M-h>', 'zh')
vim.keymap.set('n', '<M-l>', 'zl')
vim.keymap.set('n', '<M-j>', '<C-e>')
vim.keymap.set('n', '<M-k>', '<C-y>')
vim.keymap.set('n', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('n', '<ScrollWheelUp>', '<C-y>')


keys.register(
  {
    ['?'] = { telescope.oldfiles, 'recent files' },
    ['/'] = { telescope.current_buffer_fuzzy_find, 'find line' },
    h = { telescope.help_tags, 'help' },
    f = {
      name = 'file',
      d = { telescope.find_files, 'find files' },
      g = { telescope.git_files, 'git files' },
      f = { cmd 'e %:h', 'manage files' },
      s = { cmd 'w', 'save' },
      a = { cmd 'A', 'alternate file' },
    },
    b = {
      name = 'buffer',
      b = { u.buffer_picker, 'switch' },
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
      f = { u.fuzzy_find_files, 'fuzzy' },
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
      g = { cmd 'Neogit', 'git status' },
      c = { cmd 'Git commit', 'commit' },
      s = { gitsigns.stage_hunk, 'stage' },
      r = { gitsigns.reset_hunk, 'reset hunk' },
      R = { gitsigns.reset_buffer, 'reset buffer' },
      k = { gitsigns.prev_hunk, 'previous hunk' },
      j = { gitsigns.next_hunk, 'next hunk' },
      p = { gitsigns.preview_hunk_inline, 'preview hunk' },
    },
    q = { cmd 'bd!', 'delete buffer' },
  },
  { prefix = "<leader>" }
)
