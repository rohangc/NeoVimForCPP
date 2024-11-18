-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has('win32') or vim.fn.has('win64') then
    vim.opt.rtp:append(vim.fn.expand('~/nvim'))
    --vim.opt.rtp:append(vim.fn.expand('~/nvim/after'))
else
    vim.opt.rtp:append(vim.fn.expand('~/.config/nvim'))
    --vim.opt.rtp:append(vim.fn.expand('~/.config/nvim/after'))
end

-- Show diagnostic messages *also* in a hover window
--
-- Manually by pressing "C-w d" in normal mode or by simply hover the cursor over the
-- offending line
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        show_header = true,
        source = "always",  -- Or "if_many"
        border = "rounded",
    },
})

vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- When searching try to be smart about cases 
vim.opt.smartcase = true

-- My preferred settings
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
vim.keymap.set('n', '<C-n>', ':tnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':tprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F5>', ':cprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F6>', ':cnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<2-LeftMouse>', '*', { noremap = true, silent = true })

-- Insert your GUI specific code here:
if vim.fn.has('gui_running') == 1 then
    if vim.g.neovide then
        -- Put anything you want to happen only in Neovide here
        vim.g.neovide_hide_mouse_when_typing = true

        -- Font (available only when running a GUI)
        if (vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1) then
            -- The default Windows font.
            -- Install your favourite font and edit the following line.
            vim.opt.guifont = 'Cascadia Code:h11'
            -- https://github.com/mietzen/juliamono-nerd-font
            --vim.opt.guifont = "JuliaMono Nerd Font Mono:h12.25"
        end
    end
end
