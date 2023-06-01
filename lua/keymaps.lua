local keys = require('which-key')
local gitsigns = require('gitsigns')
local telescope = require('telescope.builtin')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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
      f = { cmd 'e %:h', 'manage files' },
      s = { cmd 'w', 'save' },
      a = { cmd 'A', 'alternate file' },
    },
    b = {
      name = 'buffer',
      b = { buffer_picker, 'switch' },
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
      g = { cmd 'Neogit', 'git status' },
      s = { gitsigns.stage_hunk, 'stage' },
      k = { gitsigns.prev_hunk, 'previous hunk' },
      j = { gitsigns.next_hunk, 'next hunk' },
      p = { gitsigns.preview_hunk_inline, 'preview hunk' },
    },
    q = { cmd 'bd!', 'delete buffer' },
  },
  { prefix = "<leader>" })
