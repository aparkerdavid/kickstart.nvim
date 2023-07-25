-- [nfnl] Compiled from scratch.fnl by https://github.com/Olical/nfnl, do not edit.
local input = {winopts = {width = 10, height = 1, relative = "editor", col = 0, row = 0}}
local menu = {winopts = {width = 10, height = 20, relative = "editor", col = 0, row = 0}}
local function map(list, func)
  local acc = {}
  for _, item in ipairs(list) do
    table.insert(acc, item)
  end
  return nil
end
local function open_control(control)
  control.bufnr = vim.api.nvim_create_buf(false, true)
  control.winid = vim.api.nvim_open_win(control.bufnr, true, control.winopts)
  return nil
end
local function close_control(control)
  if control.bufnr then
    vim.api.nvim_buf_delete(control.bufnr, {})
  else
  end
  control.bufnr = nil
  return nil
end
local function bind_key(control, key, func)
  return vim.keymap.set("n", key, func, {buffer = control.bufnr})
end
local function create_autocmd(control, event, func)
  return vim.api.nvim_create_autocmd({event}, {buffer = control.bufnr, callback = func})
end
local function next()
end
local function prev()
end
local function close()
  close_control(input)
  return close_control(menu)
end
local function open(opts)
  open_control(menu)
  open_control(input)
  create_autocmd(input, "WinLeave", close)
  create_autocmd(input, "TextChanged", opts["on-filter"])
  bind_key(input, "<ESC>", close)
  for idx, candidate in pairs(opts.candidates) do
    vim.api.nvim_buf_set_lines(menu.bufnr, idx, idx, false, {candidate.text})
  end
  return nil
end
local function _2_()
  return nil
end
open({["on-filter"] = _2_, candidates = {{id = 1, text = "foo"}, {id = 2, text = "bar"}}})
return {open = open}
