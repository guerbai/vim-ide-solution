local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- nvim
Plug 'liuchengxu/vim-which-key'
Plug 'nvim-lua/plenary.nvim'

-- UI
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
-- Plug 'luochen1990/rainbow'
-- Plug 'kyazdani42/nvim-web-devicons'

-- Plug 'ayu-theme/ayu-vim'
-- Plug('folke/tokyonight.nvim', {branch='main'})
Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug('kaicataldo/material.vim', {branch = 'main' })
Plug 'junegunn/seoul256.vim'

-- project
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug('junegunn/fzf', {['do']='->fzf#install()'})
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'lewis6991/gitsigns.nvim'
-- Plug 'kyazdani42/nvim-tree.lua'
-- Plug 'akinsho/toggleterm.nvim'

-- edit
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-spectre' -- project replace
Plug 'windwp/nvim-autopairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'codota/tabnine-vim'
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
-- Plug('fatih/vim-go', {['do']=':GoUpdateBinaries'})

-- language & edit
Plug('neoclide/coc.nvim', {branch='release'})
Plug 'liuchengxu/vista.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'solarnz/thrift.vim' -- thrift
Plug 'tpope/vim-dadbod' -- mysql
Plug 'kristijanhusak/vim-dadbod-ui' -- mysql-ui

vim.call('plug#end')

-- one line config
vim.cmd [[ colorscheme material ]]
vim.g.material_theme_style = 'palenight'
vim.api.nvim_set_keymap('v', '<Leader>/', ':Commentary<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>sh', ':FloatermToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>', ":WhichKey ','<CR>", {noremap = true, silent=true})
vim.g.gitgutter_map_keys = 0
-- vim.g.rainbow_active = 1
vim.g.rooter_patterns = {'.git', 'go.mod', 'plugged'}
vim.g.UltiSnipsExpandTrigger = "<C-j>"

local load_modules = {
   "plugins.configs.vista",
   "plugins.configs.treesitter",
   "plugins.configs.coc",
   "plugins.configs.nerdtree",
   "plugins.configs.airline",
   "plugins.configs.fzf",
   "plugins.configs.mysql",
}

for _, module in ipairs(load_modules) do
   require(module)
end

require('nvim-autopairs').setup{}
