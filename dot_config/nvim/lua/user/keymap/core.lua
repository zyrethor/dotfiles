local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback


return {
  ["i|<C-j>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-k>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Move cursor to right"),
	["i|jk"] = map_cmd("<ESC>"):with_noremap():with_silent():with_desc("ESC"),
	
  ["n|<leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
  ["n|<S-l>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<S-h>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<A-S-l>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent():with_desc("buffer: Move current to next"),
	["n|<A-S-h>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent():with_desc("buffer: Move current to prev"),
	["n|<leader>w"] = map_cr("w"):with_noremap():with_silent():with_desc("Save"),
	["n|<leader>q"] = map_cr("q"):with_noremap():with_silent():with_desc("Quit"),
	["nv|<leader>W"] = map_cmd("<Cmd>HopWordMW<CR>"):with_noremap():with_desc("jump: Goto word"),
}
