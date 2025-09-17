return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
  },
  config = function()
    require('CopilotChat').setup {
      -- See Configuration section for options
      model = 'gpt-4.1', -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = 'float',
        width = 90, -- Fixed width in columns
        height = 25, -- Fixed height in rows
        border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
        title = '🤖 AI Assistant',
        zindex = 100, -- Ensure window stays on top
      },

      headers = {
        user = '👤 You: ',
        assistant = '🤖 Copilot: ',
        tool = '🔧 Tool: ',
      },
      separator = '━━',
      show_folds = false, -- Disable folding for cleaner look
    }

    vim.keymap.set('n', '<leader>ccq', function()
      local chat = require 'CopilotChat'

      local input = vim.fn.input 'Quick Chat: '
      if input ~= '' then
        chat.ask(input)
      end
    end, { desc = 'CopilotChat - Quick chat' })

    vim.keymap.set('x', '<leader>ccs', function()
      local input = vim.fn.input 'Quick Chat (Selection): '
      if input ~= '' then
        require('CopilotChat').ask(input)
      end
    end, { desc = 'CopilotChat - Quick chat (Selection)' })

    vim.keymap.set('n', '<leader>cco', function()
      require('CopilotChat').open()
    end, { desc = 'CopilotChat - Quick chat (Open)' })
  end,
}
