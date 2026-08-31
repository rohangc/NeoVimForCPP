return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = false }, -- Kept disabled for Telescope
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Standard Terminal Toggles
    { "<leader>tf", function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, desc = "Toggle [F]loating terminal" },
    { "<leader>tl", function() Snacks.terminal.toggle(nil, { win = { position = "left", width=0.5 } }) end, desc = "Toggle docked terminal - [L]eft" },
    { "<leader>ti", function()
        if Snacks.indent.enabled then
          Snacks.indent.disable()
        else
          Snacks.indent.enable()
        end
      end,
      desc = "Toggle [I]ndent hints"
    },
    -- Other Utilities
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "[B]uffer [D]elete" },
  },
}
