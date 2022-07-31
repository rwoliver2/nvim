-- Robert Oliver's Neovim Configuration
-- Inspired by Derik Taylor and Luke Smith's configuration
-- To install, copy to ~/.config/nvim/init.lua and ~/.config/nvim/lua/plugins.lua

-- Load pluigns
require('plugins')

-- Make things easier
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api
local cmd = vim.cmd

-- Activate colors and set theme
o.termguicolors = true
g.tokyonight_style = 'night'
g.tokyonight_italic_functions = true
cmd[[colorscheme tokyonight]]

-- Decrase update time
o.timeoutlen = 500
o.updatetime = 200

-- Backup and swap files
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Editor UI
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.history = 100

-- Buffers
o.splitright = true
o.splitbelow = true

-- Tabs
o.expandtab = false
o.smarttab = true
o.cindent = true
o.autoindent = true
o.shiftwidth = 4
o.tabstop = 4

-- Wrapping
o.wrap = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Ruler
o.ruler = true

-- Mouse control
o.mouse = "a"

-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- Autoload plugins on certain filetypes
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex call pencil#init() ]], false)
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex setlocal nonu ]], false)
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex DittoOn ]], false)
