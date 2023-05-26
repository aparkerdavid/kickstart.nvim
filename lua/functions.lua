function P(item)
  print(vim.inspect(item))
  return item
end

function R(module)
  require('plenary.reload').reload_module(module)
  return require(module)
end
