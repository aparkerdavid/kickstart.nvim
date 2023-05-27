return {
  'TimUntersberger/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      kind = 'vsplit',
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },
    }
  end
}
