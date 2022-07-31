-- Neovim Configuration for Robert Oliver
-- Inspired mainly by the configuration of Derik Taylor and Luke Smith
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

-- Activate Pencil upon loading text files
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex call pencil#init() ]], false)
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex let g:pencil#textwidth = 80 ]], false)
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex SoftPencil ]], false)

-- Actiate additional writing plugins for text files
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex call lexical#init() ]], false)
A.nvim_exec([[ autocmd FileType markdown,mkd,text,tex call litecorrect#init() ]], false)

-- Add thesaurus and dictionary
g["lexical#dictionary"] = {"/usr/share/dict/words"}
g["lexical#thesaurus"] = {"~/.local/share/thesaurus.txt"}
g["lexical#spell"] = true

-- Function for keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Tree setup
-- #TODO -- Move this to its own file
map("n", "<CS-T>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
require("nvim-tree").setup({
	view = {
		width = 30,
		height = 30,
	},
	renderer = {
		group_empty = true,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		icons = {
			webdev_colors = true,
			show = {
				file = false,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				folder = {
					arrow_closed = '⇴',
					arrow_open = '⤷',
					default = '📁',
					open = '📂',
					empty = '📁',
					empty_open = '📂',
					symlink = '🔗',
					symlink_open = '🔗',
				},
				git = {
					unstaged = '✗',
					staged = '✓',
					unmerged = 'ఽ',
					renamed = '➜',
					untracked = '★',
					deleted = '⚠',
					ignored = '◌',
				}
			}
		}
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 500,
          exclude = {},
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
	}
})

-- Lightline
g["battery#update_statusline"] = true
g["battery#update_tabline"] = true
g.lightline = {
	colorscheme = "powerline"
}

-- Rainbow
g.rainbow_active = true
g.rainbow_guifgs = {"DarkOrange3"}

