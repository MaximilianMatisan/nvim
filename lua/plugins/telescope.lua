
return {
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
		vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
}
