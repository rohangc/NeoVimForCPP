return {
  'olimorris/codecompanion.nvim',
  cmd = {'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionCLI', 'CodeCompanionCmd', 'CodeCompanionActions'},
  keys = {
    {
      '<leader>cc',
      '<cmd>CodeCompanionChat<CR>',
      mode = 'n',
      desc = '[C]odeCompanion [C]hat',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'romus204/tree-sitter-manager.nvim',
    'zbirenbaum/copilot.lua',
    {
      'ravitemer/mcphub.nvim',
      cmd = { "MCPHub" },
      dependencies = { "nvim-lua/plenary.nvim" },
      build = "npm install -g mcp-hub@latest",
      opts = {
        port = 3000,
        config = vim.fn.expand('~/mcpservers.json'),
      },
    },
  },
  opts = {
    interactions = {
      chat = { adapter = 'copilot' },
      inline = { adapter = 'copilot' },
      cmd = {adapter = 'copilot'},
      background = { adapter = 'copilot' },
      cli = {
        agent = 'copilot',
        opts = {
          auto_insert = true,
        },
        agents = {
          copilot = {
            cmd = 'copilot',
            args = {},
            description = 'GitHub Copilot CLI',
            provider = 'terminal',
          },
        },
      },
    },
    keymaps = {
      completion = {
        modes = {
          i = '<C-Space>',
        },
      },
      send = {
        modes = {
          n = { '<CR>', '<C-s>' },
          i = '<CR>',
        },
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          -- Newer CodeCompanion builds no longer expose interactions.chat.variables.
          -- Keep MCP tools/slash commands enabled, but disable variable injection to avoid crashes.
          make_vars = false,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
}
