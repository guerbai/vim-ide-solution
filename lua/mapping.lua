vim.g.mapleader = ','

function nore_map(mode, f, t)
  vim.api.nvim_set_keymap(mode, f, t, {noremap = true})
end

-- edit
-- nore_map('n', '<Leader>w', ':write<CR>')
nore_map('v', '<Leader>y', '"*y')
nore_map('n', '<Leader>bs', 'g<C-g>2gs')
nore_map('n', '<Leader>s', ':write<CR>')

-- config
nore_map('n', '<Leader>vi', ':e ~/.config/nvim/init.lua<CR>')
nore_map('n', '<Leader>vm', ':e ~/.config/nvim/lua/mapping.lua<CR>')
nore_map('n', '<Leader>vs', ':e ~/.config/nvim/lua/setting.lua<CR>')
nore_map('n', '<Leader>vp', ':e ~/.config/nvim/lua/plugins/init.lua<CR>')
nore_map('n', '<Leader>vr', ':lua ReloadMyConfig()<CR>')


-- buffer/window
nore_map('n', '<Leader>e', ':enew<CR>')
nore_map('n', '<Leader>bn', ':bn<CR>')
nore_map('n', '<Leader>bp', ':bp<CR>')
nore_map('n', '<Leader>bd', ':bp|bd #<cr>')
nore_map('n', '<Leader>bo', ':%bdelete|edit #|normal `"<cr>')

nore_map('n', '<Leader>wh', '<C-w>h<CR>')
nore_map('n', '<Leader>wl', '<C-w>l<CR>')
nore_map('n', '<Leader>wj', '<C-w>j<CR>')
nore_map('n', '<Leader>wk', '<C-w>k<CR>')
nore_map('n', '<Leader>wc', '<C-w>c<CR>')
nore_map('n', '<Leader>wq', ':cclose<CR>')
nore_map('n', '<Leader>wp', ':pclose<CR>')

nore_map('', '<C-n>', ':cnext<CR>')
nore_map('', '<C-p>', ':cprevious<CR>')

-- terminal
nore_map('t', '<ESC>', ':<C-\\><C-n><CR>')

-- json
nore_map('n', '<Leader>=j', ':%!python -m json.tool<CR>')
nore_map('v', '<Leader>=j', ":'<,'>!python -m json.tool<CR>")
