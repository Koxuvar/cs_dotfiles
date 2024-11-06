return{
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ 'nvim-treesitter/playground' },
	{ 'ThePrimeagen/harpoon'},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }, },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
}
