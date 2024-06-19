local ui = {}

ui["tikhomirov/vim-glsl"] = { lazy = true }
ui["projekt0n/github-nvim-theme"] = {lazy = true}
-- ui["olimorris/onedarkpro.nvim"] = {lazy = false}
ui["navarasu/onedark.nvim"] = {
  lazy = false,
  config = require("configs.ui.onedark")
}
ui["RRethy/vim-illuminate"] = {
  lazy = false,
}

return ui
