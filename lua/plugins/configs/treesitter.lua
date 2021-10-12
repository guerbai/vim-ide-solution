require'nvim-treesitter.configs'.setup {
  ensure_installed = {
     "lua",
     "python",
     "go"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}
