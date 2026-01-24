return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local function lsp_name()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return "No LSP"
			end
			return clients[1].name
		end
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_x = {
					lsp_name,
					"filetype",
				},
			},
		})
	end
}
