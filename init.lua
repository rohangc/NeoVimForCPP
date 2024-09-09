----------------------------------------------------------------------------------
--                         Using Vim-Plug plugin manager
----------------------------------------------------------------------------------
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Emulate Windows behaviour also for cut/copy/paste
vim.cmd('source $VIMRUNTIME/mswin.vim')

----------------------------------------------------------------------------------
--                                    Plug-ins
----------------------------------------------------------------------------------
local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- My Plugins
Plug 'junegunn/vim-plug'
Plug 'AlessandroYorba/Alduin'
Plug 'Raimondi/delimitMate'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'scrooloose/nerdcommenter'
Plug 'yegappan/taglist'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Linux-only plugin
if (not vim.fn.has("win32")) and (not vim.fn.has("win64")) then
    Plug 'cdelledonne/vim-cmake'
end
Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v4.x'})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- All of your Plugs must be added before the following line
vim.call('plug#end')

-- Brief help:
-- :PlugInstall to install the plugins
-- :PlugUpdate to install or update the plugins
-- :PlugDiff to review the changes from the last update
-- :PlugClean to remove plugins no longer in the list

-- Put your non-Plug stuff after this line
----------------------------------------------------------------------------------

-- My Colour scheme
vim.cmd('colorscheme alduin')

-- My font (on Windows only)
if vim.fn.has('gui_running') == 1 and (vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1) then
  vim.opt.guifont = 'Consolas:h10'
end

if vim.fn.has('win32') or vim.fn.has('win64') then
    vim.opt.rtp:append(vim.fn.expand('~/nvim'))
    vim.opt.rtp:append(vim.fn.expand('~/nvim/after'))
else
    vim.opt.rtp:append(vim.fn.expand('~/.config/nvim'))
    vim.opt.rtp:append(vim.fn.expand('~/.config/nvim/after'))
end

-- When searching try to be smart about cases 
vim.opt.smartcase = true

-- My preferred settings
vim.opt.completeopt:remove('preview')
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.backup = false
vim.opt.list = false
vim.opt.undofile = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
-- vim.opt.smarttab = true  -- Uncomment if needed
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.textwidth = 0
vim.opt.wrap = true
vim.opt.wrapmargin = 0
vim.opt.wildignore:append { '*\\tmp\\*', '*.dll', '*.exe', '*.exp', '*.gz', '*.ilk', '*.lib', '*.o', '*.pdb', '*.pch', '*.so', '*.swp', 'tags', '*.tar', '*.zip' }

-- My keymaps and variables
vim.g.Tlist_Inc_Winwidth = 0
vim.g.Tlist_WinWidth = 70
vim.g.ctrlp_working_path_mode = 'ra'

vim.keymap.set('n', '<C-n>', ':tnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':tprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F5>', ':cprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F6>', ':cnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F9>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', ':TlistToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ':term<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<2-LeftMouse>', '*', { noremap = true, silent = true })

-- For plugin 'drmingdrmer/vim-toggle-quickfix':
vim.keymap.set('n', '<C-g><C-o>', '<Plug>window:quickfix:loop', { noremap = false, silent = true })

-- For plugin 'nvim-telescope/telescope.nvim':
-- Note: We have retained the default leader key of: '\' in this configuration.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

----------------------------------------------------------------------------------
--                                   LSP stuff
--                     https://lsp-zero.netlify.app/v4.x/tutorial.html
----------------------------------------------------------------------------------
local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

----------------------------------------------------------------------------------
--                                   CMP stuff
--                     https://lsp-zero.netlify.app/v4.x/tutorial.html
----------------------------------------------------------------------------------
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Navigate between completion items
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
    ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})

----------------------------------------------------------------------------------
--                                 NVimTree stuff
----------------------------------------------------------------------------------
require('nvim-tree').setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 60,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = false
  }
})
