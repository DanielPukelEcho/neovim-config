vim.g.mapleader = " "
-- vim.g.netrw_keepdir = 0

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

vim.cmd("packadd! matchit")
