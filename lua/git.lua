local gitsigns = require('gitsigns')
local util = require('util')
local git = {}

function git.reset()
  if vim.fn.mode() == 'n' then
    gitsigns.reset_hunk()
  else
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end
end

function git.stage()
  if vim.fn.mode() == 'n' then
    gitsigns.stage_hunk()
  else
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end
end

git.status = util.split_command('Git')
git.commit = util.split_command('Git commit')

return git
