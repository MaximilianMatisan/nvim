
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		require("neo-tree").setup({
				window = {
					position = "left",
					width = 0,
					auto_expand_width = true
				},
			default_component_configs = {
				git_status = {
					symbols = {
						added     = "+",
						modified  = "",
						deleted   = "x",
						renamed   = ">",
						untracked = "?",
						unstaged  = "",
						ignored   = "i",
						staged    = "s",
						conflict  = "!",
					},
				},
			}
		})
		vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
		vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
	end,
}
