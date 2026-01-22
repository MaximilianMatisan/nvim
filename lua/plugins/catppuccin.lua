
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		flavour = "frappe" -- latte, frappe, macchiato, mocha
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
	end
}

