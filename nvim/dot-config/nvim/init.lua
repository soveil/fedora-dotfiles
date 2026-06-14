vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.ai = vim.g.ai or false

require("opts")
require("autocmds")
require("keymaps")
require("origami-edited")
require("lazy-bootstrap")
