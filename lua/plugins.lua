local packer = require("packer")
packer.startup(
  function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")
	-- 你的插件列表...
	-- tokyonight
        use("folke/tokyonight.nvim")

	-- nvim-tree
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- bufferline
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye"  } })

	-- lualine
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")

	-- telescope
	use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
	use 'simrat39/symbols-outline.nvim'
	-- treesitter （新增）
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use {"windwp/nvim-autopairs"}

	--------------------- LSP --------------------
	-- Installer
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	-- Lspconfig
	use({ "neovim/nvim-lspconfig" })

	-- git
	use({ 'doronbehar/nvim-fugitive' })
	use {'numToStr/Comment.nvim'}
end)
