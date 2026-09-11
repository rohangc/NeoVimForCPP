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
    -- 1. Added full configuration to copilot.lua here to handle background auth natively
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup({
          suggestion = { enabled = true }, -- Set to true if you want inline ghost-text/LSP behavior!
          panel = { enabled = false },
        })
      end,
    },
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
    log_level = 'DEBUG',

    adapters = {
      http = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = 'claude-haiku-4.5',
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = 'copilot',
        tools = {
          opts = {
            -- Keeps Neovim's active LSP diagnostics pipeline tied directly into chat queries
            default_tools = { 'get_diagnostics', 'mcp' },
          },
        },
      },
      inline = { adapter = 'copilot' },
      cmd = { adapter = 'copilot' },
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
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          make_tools = true,
          show_server_tools_in_chat = true,
          add_mcp_prefix_to_tool_names = false,
          make_vars = false, -- Disabling variable injections keeps MCP from crashing newer CC builds
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
}
