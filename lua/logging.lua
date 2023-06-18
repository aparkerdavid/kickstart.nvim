local logging = {}

function logging.log(item, label)
  local log_str = vim.inspect(item)

  if label then
    log_str = label .. ": " .. log_str
  end

  log_str = log_str .. "\n\n"

  local log_file = io.open("/Users/parkerrueve/.config/nvim/log", "a")
  io.output(log_file)
  io.write(log_str)
  io.close(log_file)
end

return logging
