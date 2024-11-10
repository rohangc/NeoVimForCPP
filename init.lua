-- Emulate Windows behaviour also for cut/copy/paste
vim.cmd("source $VIMRUNTIME/mswin.vim")

-- Load global options
require('config.options')

-- Load the lazy.nvim plugin manager
require('config.lazy')
