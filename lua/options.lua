local options = {
  termguicolors = true,
  hlsearch      = false,
  mouse         = 'a',
  virtualedit   = 'onemore',
  clipboard     = 'unnamedplus',
  tabstop       = 2,
  shiftwidth    = 2,
  splitbelow    = true,
  splitright    = true,
  expandtab     = true,
  breakindent   = true,
  undofile      = true,
  ignorecase    = true,
  smartcase     = true,
  updatetime    = 250,
  timeout       = true,
  timeoutlen    = 300,
  completeopt   = 'menuone,noselect',
}

vim.keymap.set('n', '$', '$l') -- modified $ for virutaledit=onemore

local window_options = {
  signcolumn = 'yes',
  number     = true,
}

for key, value in pairs(options) do
  vim.o[key] = value
end

for key, value in pairs(window_options) do
  vim.wo[key] = value
end
