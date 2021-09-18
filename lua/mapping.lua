vim.g.mapleader = ','

function nore_map(mode, f, t)
  vim.api.nvim_set_keymap(mode, f, t, {noremap = true})
end

-- edit
nore_map('n', '<Leader>w', ':write<CR>', options)
nore_map('v', '<Leader>y', '"*y', options)
nore_map('n', '<Leader>s', 'g<C-g>2gs', options)

-- config
nore_map('n', '<Leader>vi', ':e ~/.config/nvim/init.lua<CR>', options)
nore_map('n', '<Leader>vm', ':e ~/.config/nvim/lua/mapping.lua<CR>', options)
nore_map('n', '<Leader>vs', ':e ~/.config/nvim/lua/setting.lua<CR>', {noremap = true})
nore_map('n', '<Leader>vp', ':e ~/.config/nvim/lua/plugins/init.lua<CR>', {noremap = true})
nore_map('n', '<Leader>vr', ':lua ReloadMyConfig()<CR>', {noremap = true})

-- move
nore_map('n', '<Leader>h', '<C-w>h<CR>', {noremap = true})
nore_map('n', '<Leader>l', '<C-w>l<CR>', {noremap = true})
nore_map('n', '<Leader>c', '<C-w>c<CR>', {noremap = true})

-- buffer/window
nore_map('n', '<Leader>e', ':enew<CR>', {noremap = true})
nore_map('n', '<Leader>bn', ':bn<CR>', {noremap = true})
nore_map('n', '<Leader>bp', ':bp<CR>', {noremap = true})
nore_map('n', '<Leader>bd', ':bp|bd #<cr>', {noremap = true})
nore_map('n', '<Leader>bo', ':%bdelete|edit #|normal `"<cr>', {noremap = true})

-- quickfix
nore_map('n', '<Leader>qc', ':cclose<CR>', {noremap = true})
nore_map('n', '<Leader>pc', ':pclose<CR>', {noremap = true})
nore_map('', '<C-n>', ':cnext<CR>', {})
nore_map('', '<C-p>', ':cprevious<CR>', {})

-- terminal
nore_map('t', '<ESC>', ':<C-\\><C-n><CR>', {})

-- json
nore_map('n', '<Leader>=j', ':%!python -m json.tool<CR>', {noremap=true})
nore_map('v', '<Leader>=j', ":'<,'>!python -m json.tool<CR>", {noremap=true})
