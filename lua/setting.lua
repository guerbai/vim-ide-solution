local o = vim.o
local wo = vim.wo

o.autowrite = true
o.updatetime = 100
o.ignorecase = true
o.timeoutlen = 300
o.backup = false
o.writebackup = false
-- o.syntax = 'on'

wo.number = true
wo.relativenumber = true
wo.cursorline = true
