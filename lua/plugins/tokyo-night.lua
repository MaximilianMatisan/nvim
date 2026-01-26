return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    require("tokyonight").setup({
    style = "night", --night storm day moon
    transparent = true, -- Enable this to disable setting the background color
  })
  end
}
