function silent_map(mode, f, t)
  vim.api.nvim_set_keymap(mode, f, t, { silent = true })
end

silent_map('n', '<Leader>gd', '<Plug>(coc-definition)', {silent=true})
silent_map('n', '<Leader>gr', '<Plug>(coc-references)', {silent=true})
silent_map('n', '<Leader>gK', ":call CocActionAsync('doHover')<CR>", {silent=true})
silent_map('n', '<Leader>g[', '<Plug>(coc-diagnostic-prev)', {silent=true})
silent_map('n', '<Leader>g]', '<Plug>(coc-diagnostic-next)', {silent=true})
silent_map('n', '<Leader>er', ':CocList diagnostics<CR>', {silent=true})
silent_map('n', '<Leader>qf', '<Plug>(coc-fix-current)', {silent=true})
-- silent_map('n', '<Leader>lt', '<Plug>(coc-format)', {silent=true})
silent_map('n', '<Leader>rn', '<Plug>(coc-rename)', {silent=true})
-- vim.cmd 'inoremap <expr> <Tab> pumvisible() ? "\\<C-n>" : "\\<Tab>"'
-- vim.cmd 'inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'

vim.cmd "autocmd BufWritePre * :silent call CocAction('runCommand', 'editor.action.organizeImport')"
-- vim.cmd "autocmd BufWritePre * :silent call CocAction('format')"
vim.cmd "autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4"
