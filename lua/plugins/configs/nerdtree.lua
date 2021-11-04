vim.api.nvim_set_keymap('n', '<Leader>tt', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tr', ':NERDTreeRefreshRoot<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>tf', ':NERDTreeFocus<CR>', {noremap = true})


vim.g.NERDTreeWinPos = "right"
vim.api.nvim_command([[
augroup DragQuickfixWindowDown
    autocmd FileType qf wincmd J
augroup end
]])
vim.api.nvim_command([[
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

