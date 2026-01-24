local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = " ",
			[severity.INFO] = " "
		}
	},
  virtual_text = true,
  --signs = true,
  underline = true,
  update_in_insert = true,
})
