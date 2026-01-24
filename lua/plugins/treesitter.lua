
return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	configs = function()
		require("nvim-treesitter")

		configs.setup ({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
