vim.api.nvim_set_keymap('n', '<Leader>ff', ':FZF<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fw', ':Rg<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Maps<CR>', {noremap = true})

vim.api.nvim_command([[
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -g '!{thrift_gen,kitex_gen,clients}' -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%', 'ctrl-/'), <bang>0)
]])
-- vim.api.nvim_command([[
-- command! -bang -nargs=* Rg call fzf#vim#grep( "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,   fzf#vim#with_preview('up', 'ctrl-/'), 1)
-- ]])
-- vim.api.nvim_command([[
-- command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview('up', 'ctrl-/'), <bang>0)
-- ]])
-- vim.api.nvim_command([[
-- command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
-- ]])
