require('telescope').setup{}
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files({layout_config={width=0.9}})<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fw', '<cmd>lua require("telescope.builtin").live_grep({layout_config={width=0.9}})<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
