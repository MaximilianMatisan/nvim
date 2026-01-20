
return { 
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	configs = function()
		require("nvim-treesitter")

		configs.setup ({
			ensure_installed = {"c", "lua", "rust", "java", "haskell"},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
