
return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup{
				defaults = {
					file_ignore_patterns = {"assets/"}
				}
			}
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>ft', ':Telescope colorscheme<CR>', {desc = "Opens a list of all installed themes"})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
		-- This is your opts table
		require("telescope").setup {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
						-- even more opts
					}

				}
			}
		}
		-- To get ui-select loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("ui-select")
		end
	}
}
