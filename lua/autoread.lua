-- Autoread is basically broken, so we're just gonna poll lol
vim.api.nvim_create_autocmd('BufWrite', {
  callback = function()
    local bufnr = vim.fn.bufnr()
    vim.defer_fn(
      function()
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('e!')
        end)
      end, 500)
  end
})
