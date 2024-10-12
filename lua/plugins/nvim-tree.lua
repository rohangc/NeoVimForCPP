return {
    {'nvim-tree/nvim-tree.lua',
         opt = {
             sort = {sorter = 'case_sensitive'},
             view = {width = 60},
             renderer = {group_empty = true},
             filters = {dotfiles = true},
             git = {enable = false}
         },

         -- Some sort of bug forces us to write this function (otherwise, 'opt' above would have sufficed) :
         config = function()
             require("nvim-tree").setup({})
         end,

         keys = {
             {'<F10>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, mode='n' }},
         },
    },
}
