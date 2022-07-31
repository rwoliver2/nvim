return require('packer').startup(function()
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'itchyny/lightline.vim'
	use 'vim-syntastic/syntastic'
	use 'ap/vim-css-color'
	use 'junegunn/fzf'
	use 'frazrepo/vim-rainbow'
	use 'tpope/vim-surround'
	use 'reedes/vim-pencil'
	use 'tpope/vim-fugitive'
	use 'cakebaker/scss-syntax.vim'
	use 'kchmck/vim-coffee-script'
	use 'w0rp/ale'
	use 'junegunn/goyo.vim'
	use 'kyazdani42/nvim-tree.lua'
end)

