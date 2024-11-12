return {
    {'ramojus/mellifluous.nvim',
        opts = {
            dim_inactive = false,

            colorset = 'alduin',
            --colorset = 'kanagawa_dragon',
            --colorset = 'mellifluous',
            --colorset = 'mountain',
            --colorset = 'tender',
        },

        init = function()
            -- Light/dark theme
            -- vim.opt.background('light')

            -- Colour scheme
            vim.cmd("colorscheme mellifluous")
        end
    },
}
