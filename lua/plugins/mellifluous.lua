return {
    {'ramojus/mellifluous.nvim',
        opts = {
            dim_inactive = false,

            colorset = 'alduin',
            --colorset = 'kanagawa_dragon',
            --colorset = 'mellifluous',
            --colorset = 'mountain',
            --colorset = 'tender',

            styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
                comments = { italic = true },
                --constants = {},
                --folds = {},
                --functions = {},
                --main_keywords = {},
                markup = {
                    headings = { bold = true },
                },
                --operators = {},
                --other_keywords = {},
                --strings = {},
                --types = {},
            },
            transparent_background = {
                cursor_line = true,
                enabled = false,
                file_tree = true,
                floating_windows = true,
                status_line = false,
                telescope = true,
            },
            flat_background = {
                cursor_line_number = false,
                file_tree = false,
                floating_windows = false,
                line_numbers = false,
            },
            plugins = {
                cmp = true,

                gitsigns = {
                    enabled = true,
                },
                lazy = {
                    enabled = true,
                },
                mason = {
                    enabled = true,
                },
                nvim_tree = {
                    enabled = true,
                    show_root = false,
                },
                telescope = {
                    enabled = true,
                    nvchad_like = true,
                },
                treesitter = {
                    enabled = true,
                },
            },
        },

        init = function()
            -- Light/dark theme
            -- vim.opt.background('light')

            -- Colour scheme
            vim.cmd("colorscheme mellifluous")
        end
    },
}
