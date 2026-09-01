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
            -- Keep LSP diagnostics and MCP access loaded for code queries.
            -- This covers attached-buffer diagnostics and broader LSP-style actions
            -- exposed by MCP servers (for example clangd/neovim MCP tools).
            default_tools = { 'get_diagnostics', 'mcp' },
          },
        },
      },
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
          -- Required to expose server groups (@server) and tool namespaced functions
          -- like @server__tool in CodeCompanion.
          make_tools = true,
          show_server_tools_in_chat = true,
          add_mcp_prefix_to_tool_names = false,
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
