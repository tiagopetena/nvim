local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim'}
    },


    { 
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ 'nvim-treesitter/playground' },
	{ 'theprimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive'},
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            {'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
        }
    }



})
