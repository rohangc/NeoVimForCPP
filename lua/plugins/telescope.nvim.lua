return {
    {
        'nvim-telescope/telescope.nvim',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font}
        },

        opts = {
            defaults = {
                layout_strategy = "bottom_pane",
                layout_config = {
                    height = 80,
                    prompt_position = "bottom",
                }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            }
        },

        keys = {
            { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Telescope [B]uffers', mode='n' },
            { '<leader>fd', function() require('telescope.builtin').diagnostics() end, desc = 'Telescope [D]iagnostics', mode='n' },
            { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope [F]iles', mode='n' },
            { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope live [G]rep', mode='n' },
            { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope [H]elp tags', mode='n' },
            { '<leader>fk', function() require('telescope.builtin').keymaps() end, desc = 'Telescope [K]eymaps', mode='n' },
            { '<leader>ft', function() require('telescope.builtin').tagstack() end, desc = 'Telescope [T]ag stack', mode='n' },
            { '<leader>fW', function() require('telescope.builtin').grep_string() end, desc = 'Telescope current [W]ord', mode='n' }
        },

        init = function()
            local telescope = require('telescope')

            -- Load the ui-select extension
            telescope.load_extension('ui-select')
        end,
    },
}
