return {
  'TimUntersberger/neogit',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      kind = 'vsplit',
      disable_commit_confirmation = true,
    }
  end
}
