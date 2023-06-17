vim.cmd.tnoremap('<ESC>', '<C-\\><C-n>')
vim.cmd.tnoremap('<ESC><ESC>', '<ESC>')
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber") -- no numbers
