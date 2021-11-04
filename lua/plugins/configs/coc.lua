function silent_map(mode, f, t)
  vim.api.nvim_set_keymap(mode, f, t, { silent = true })
end

silent_map('n', '<Leader>gd', '<Plug>(coc-definition)')
silent_map('n', '<Leader>gr', '<Plug>(coc-references)')
silent_map('n', '<Leader>gK', ":call CocActionAsync('doHover')<CR>")
silent_map('n', '<Leader>g[', '<Plug>(coc-diagnostic-prev)')
silent_map('n', '<Leader>g]', '<Plug>(coc-diagnostic-next)')
silent_map('n', '<Leader>ge', ':CocList diagnostics<CR>')
silent_map('n', '<Leader>gf', '<Plug>(coc-fix-current)')
-- silent_map('n', '<Leader>lt', '<Plug>(coc-format)', {silent=true})
silent_map('n', '<Leader>rn', '<Plug>(coc-rename)')
silent_map('i', '<C-l>', '<Plug>(coc-snippets-expand)')
-- vim.cmd 'inoremap <expr> <Tab> pumvisible() ? "\\<C-n>" : "\\<Tab>"'
-- vim.cmd 'inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'
-- vim.cmd "autocmd BufWritePre * :silent call CocAction('format')"

vim.cmd "autocmd BufWritePre * :silent call CocAction('runCommand', 'editor.action.organizeImport')"
vim.cmd "autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4"

vim.api.nvim_command([[
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
]])
vim.api.nvim_command([[
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])
