local severity = vim.diagnostic.severity
vim.opt.signcolumn = "yes"
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = "󰅬 ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " "
		}
	},
  --signs = true,
  float = { border = 'rounded', source = 'if_many' },
  -- underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Teest shows up underneath the line, with virtual lines update_in_insert = true,

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
})
