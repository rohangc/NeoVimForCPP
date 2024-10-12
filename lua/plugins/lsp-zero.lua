return{
    {'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },

        ----------------------------------------------------------------------------------
        --                                   LSP
        --                     https://lsp-zero.netlify.app/v4.x/tutorial.html
        ----------------------------------------------------------------------------------
        init = function()
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
                vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F4>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
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
            --                                   CMP
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
        end,
    }
}
