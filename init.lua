-- Emulate Windows behaviour also for cut/copy/paste
vim.cmd("source $VIMRUNTIME/mswin.vim")

-- Using the lazy.nvim plugin manager
require("config.lazy")
