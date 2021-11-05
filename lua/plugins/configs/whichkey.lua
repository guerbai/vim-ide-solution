require('which-key').setup {}

local wk = require("which-key")
wk.register({
    ["<Leader>s"] = {
	name = "save buffer to disk",
    },
    ["<Leader>e"] = {
	name = "open new empty buffer",
    },
    ["<Leader>b"] = {
	name = "+buffer",
	d = {"delete current buffer"},
	o = {"delete other buffers"},
	n = {"goto next buffer"},
	p = {"goto previous buffer"},
	s = {"sum up current buffer"},
    },
    ["<Leader>f"] = {
	name = "+find",
	f = {"fuzzy find file"},
	w = {"fuzzy find word"},
	b = {"fuzzy find buffers"},
	h = {"fuzzy find help tags"},
    },
    ["<Leader>w"] = {
	name = "+window",
	c = {"close current window"},
	q = {"close quickfix window"},
	p = {"close preview window"},
	h = {"go to left window"},
	l = {"go to right window"},
	j = {"go to below window"},
	k = {"go to up window"},
    },
    ["<Leader>="] = {
	name = "+format",
	j = {"json file"},
    },
    ["<Leader>g"] = {
	name = "+language",
	d = {"go to definition"},
	r = {"go to references"},
	K = {"display method info"},
	f = {"quick fix err"},
	e = {"all diagnostics"},
	n = {"rename symbol"},
    },
    ["<Leader>v"] = {
	name = "+nvim config",
	r = {"reload neovim config"},
    },
    ["<Leader>t"] = {
	name = "+sidebar",
	a = {"toggle file structure"},
	t = {"toggle project tree"},
	r = {"refresh project tree"},
    }
})
