local vscode = {}

function vscode.is_embedded()
  return not not vim.g.vscode
end

function vscode.setup()
  require('lazy').setup({
    'cohama/lexima.vim',
    { 'numToStr/Comment.nvim',   opts = {} },
    { import = 'plugins.minimal' },
  }, {})

  require('options')
end

return vscode
