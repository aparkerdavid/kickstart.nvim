local window = {}

function window.hsplit(cmd)
  vim.cmd('bel ' .. cmd)
end

function window.vsplit(cmd)
  vim.cmd('vertical ' .. cmd)
end

function window.is_wide()
  return vim.fn.winwidth(0) > 160
end

function window.split(cmd)
  if window.is_wide() then
    window.vsplit(cmd)
  else
    window.hsplit(cmd)
  end
end

return window
