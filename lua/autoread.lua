local function schedule_checktime(bufnr, wait)
  vim.defer_fn(
    function()
      if vim.fn.bufexists(bufnr) then
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('checktime')
        end)
      end
    end, wait)
end
-- Autoread is basically broken, so instead we POLL POLL POLL
vim.api.nvim_create_autocmd('BufWrite', {
  callback = function()
    if vim.o.autoread then
      local time = 0
      local bufnr = vim.fn.bufnr()
      repeat
        schedule_checktime(bufnr, time)
        time = time + 50
      until time >= 1000
    end
  end
})
