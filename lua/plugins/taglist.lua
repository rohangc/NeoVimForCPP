return {
    {'yegappan/taglist',

        keys = {
            { '<F9>', ':TlistToggle<CR>', noremap = true, silent = true, mode = 'n' }
        },

        init = function()
            vim.g.Tlist_Inc_Winwidth = 0
            vim.g.Tlist_WinWidth = 60
        end,
    },
}
