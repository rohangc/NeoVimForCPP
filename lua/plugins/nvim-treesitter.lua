return {
    {'nvim-treesitter/nvim-treesitter',
        branch = 'master',

        build = ':TSUpdate',

        main = 'nvim-treesitter.configs', -- Sets main module to use for opts

        opts = {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {'c', 'cpp', 'diff', 'gitcommit', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline'},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            --ignore_install = { "javascript" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                --disable = {'fortran'},
                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- disable = { "c", "rust" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                  -- Disable for fortran.
                  if lang == 'fortran' then
                    return true
                  end
                  -- Disable for large buffers
                  local max_filesize = 1000 * 1024 -- 1000 KB
                  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                      return true
                    end
                  -- Disable for specific file extensions
                    local ext = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":e")
                    local disabled_exts = { dll = true, exe = true, ilk = true, lib = true, o = true, pdb = true }
                    if disabled_exts[ext] then
                      return true
                    end
                  end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            indent = {enable = false},
        },
    },

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textob
}
