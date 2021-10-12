vim.g.vista_sidebar_position='vertical topleft'
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'coc'

vim.api.nvim_set_keymap('n', '<Leader>ta', ':Vista!!<CR>', {noremap = true})
