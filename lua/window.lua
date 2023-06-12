local window = {}

function window.hsplit(cmd)
  vim.cmd('bel ' .. cmd)
end

function window.vsplit(cmd)
  vim.cmd('vertical ' .. cmd)
end

function window.split(cmd)
  if vim.fn.winwidth(0) > 160 then
    window.vsplit(cmd)
  else
    window.hsplit(cmd)
  end
end

return window
