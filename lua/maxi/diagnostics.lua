local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = "E",
			[severity.WARN] = "W",
			[severity.HINT] = "󰌶",
			[severity.INFO] = "i"
		}
	},
  virtual_text = true,
  --signs = true,
  underline = true,
  update_in_insert = true,
})
