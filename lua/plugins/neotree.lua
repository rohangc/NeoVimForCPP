return {
    {'nvim-neo-tree/neo-tree.nvim',
        version = '*',
        dependencies = {
            'antosha417/nvim-lsp-file-operations',
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons' -- not strictly required, but recommended
        },
        lazy = false,
        keys = {
            { '<F10>', ':Neotree filesystem toggle<CR>', desc = 'NeoTree filesystem toggle', silent = true },
        },
    },
}
