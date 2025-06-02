return {
    {'nvim-tree/nvim-tree.lua',
         opts = {
             sort = {sorter = 'case_sensitive'},
             view = {width = 60},
             renderer = {group_empty = true},
             filters = {dotfiles = true},
             git = {enable = false}
         },

         keys = {
             { '<F10>', ':NvimTreeToggle<CR>', noremap = true, silent = true, mode='n' }
         },
    },
}
