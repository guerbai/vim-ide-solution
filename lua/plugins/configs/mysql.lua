vim.g.db_ui_winwidth = 30
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_save_location = "~/repos/sql"

vim.cmd 'autocmd FileType sql vmap <buffer> <leader>S <Plug>(DBUI_ExecuteQuery) <c-w>jjzR'
vim.cmd 'autocmd FileType dbout nnoremap <buffer> <leader>k <c-w>k<c-w>l'
vim.cmd 'autocmd FileType dbout nnoremap <buffer> <leader>c <c-w>c<c-w>l'
vim.cmd 'autocmd FileType sql setlocal previewheight=30'
-- "autocmd FileType dbout setlocal nofoldenable
