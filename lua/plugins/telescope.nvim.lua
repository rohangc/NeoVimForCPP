return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font}
        },

        opts = {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            }
        },

        init = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            -- Load the ui-select extension
            telescope.load_extension('ui-select')

            vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Telescope [B]uffers'})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = 'Telescope [D]iagnostics'})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Telescope [F]iles'})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Telescope live [G]rep'})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope [H]elp tags'})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Telescope [K]eymaps'})
            vim.keymap.set('n', '<leader>ft', builtin.tagstack, {desc = 'Telescope [T]ag stack'})
            vim.keymap.set('n', '<leader>fW', builtin.grep_string, { desc = 'Telescope current [W]ord'})
        end,
    },
}
