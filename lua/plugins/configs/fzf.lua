vim.api.nvim_set_keymap('n', '<Leader>f', ':FZF<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fw', ':Rg<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Maps<CR>', {noremap = true})

vim.api.nvim_command([[
command! -bang -nargs=* Rg call fzf#vim#grep( "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,   fzf#vim#with_preview('up', 'ctrl-/'), 1)
]])
vim.api.nvim_command([[
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview('up', 'ctrl-/'), <bang>0)
]])
