-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local insert_mappings = {
  ['<M-BS>'] = '<C-w>',
  ['<M-h>'] = '<C-o>zh',
  ['<M-l>'] = '<C-o>zl',
  ['<M-j>'] = '<C-o><C-e>',
  ['<M-k>'] = '<C-o><C-y>',
  ['<ScrollWheelDown>'] = '<C-o><C-e>',
  ['<ScrollWheelUp>'] = '<C-o><C-y>',
}

for key, binding in pairs(insert_mappings) do
  vim.keymap.set({ 'c', 'i' }, key, binding)
end
