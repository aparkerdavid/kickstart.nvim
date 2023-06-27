local telescope = require('telescope.builtin')
local funkyfinder = require('funkyfinder')
local keys = require('which-key')
local gitsigns = require('gitsigns')
local git = require('git')
local files = require('files')
local u = require('util')
local cmd = u.command

local normal_mappings = {
  ['<M-h>'] = { 'zh', 'scroll right' },
  ['<M-l>'] = { 'zl', 'scroll left' },
  ['<M-j>'] = { '<C-e>', 'scroll down' },
  ['<M-k>'] = { '<C-y>', 'scroll up' },
  ['<ScrollWheelDown>'] = { '<C-e>', 'scroll down' },
  ['<ScrollWheelUp>'] = { '<C-y>', 'scroll up' },
}

local leader_mappings = {
  ['?'] = { telescope.oldfiles, 'recent files' },
  ['/'] = { funkyfinder.search_buffer, 'find line' },
  h = { telescope.help_tags, 'help' },
  f = {
    name = 'file',
    d = { files.find, 'find files' },
    g = { files.git, 'git files' },
    f = { files.manage, 'manage files' },
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
  t = {
    name = 'test',
    t = { cmd 'TestNearest', 'nearest' },
    f = { cmd 'TestFile', 'file' },
    a = { cmd 'TestSuite', 'file' },
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
    g = { git.status, 'git status' },
    c = { git.commit, 'commit' },
    s = { git.stage, 'stage' },
    r = { git.reset, 'reset' },
    S = { gitsigns.stage_buffer, 'stage buffer' },
    R = { gitsigns.reset_buffer, 'reset buffer' },
    k = { gitsigns.prev_hunk, 'previous hunk' },
    j = { gitsigns.next_hunk, 'next hunk' },
    p = { gitsigns.preview_hunk_inline, 'preview hunk' },
    ['?'] = { cmd '0Gclog', 'history' },
  },
  q = { cmd { 'bp', 'bd!#' }, 'delete buffer' },
}

local normal_modes = { 'v', 'n' }

for _, mode in pairs(normal_modes) do
  keys.register(normal_mappings, { mode = mode })
end

for _, mode in pairs(normal_modes) do
  keys.register(leader_mappings, { prefix = '<leader>', mode = mode })
end
