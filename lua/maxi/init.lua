require("maxi.remap")
require("maxi.diagnostics")

-- theme & transparency
-- PLUGIN-THEMES: catppuccin vague rose-pine tokyonight everforest
vim.cmd.colorscheme("everforest") --default unokai desert elflord evening industry morning murphy pablo peachpuff ron shine slate torte zellner
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

-- Basic settings
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", {
	bg = "#303030",
})
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.wrap = false                               -- Don't wrap lines
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor
vim.opt.winborder = "rounded"			                 -- Rounded pop-up container for fn infos	
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end) -- os clipboard as default reg
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.g.have_nerd_font = true
vim.o.updatetime = 250                             -- Decrease update time
vim.o.timeoutlen = 300                             -- Decrease mapped sequence wait time

-- Indentation
vim.opt.smartindent = true                         -- Smart auto-indenting

-- Search settings
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results 
vim.opt.incsearch = true                           -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.showmatch = true                           -- Highlight matching brackets
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options 
vim.opt.pumblend = 10                              -- Popup menu transparency 

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
-- Command-line completion
vim.opt.wildmenu = true

-- Save undo history
vim.o.undofile = true
