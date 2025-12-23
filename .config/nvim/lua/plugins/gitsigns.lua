-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
--

-- Alternatively, use `config = function() ... end` for full control over the configuration.
-- If you prefer to call `setup` explicitly, use:
--    {
--        'lewis6991/gitsigns.nvim',
--        config = function()
--            require('gitsigns').setup({
--                -- Your gitsigns configuration here
--            })
--        end,
--    }
--
-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>gb", require("gitsigns").blame, { desc = "[G]itsign [B]lame" })
    vim.keymap.set("n", "<leader>gc", require("gitsigns").show_commit, { desc = "[G]itsign Show [C]ommit" })
    vim.keymap.set("n", "<leader>gtb", require("gitsigns").toggle_current_line_blame, { desc = "[G]itsign [T]oggle [B]lame" })
    vim.keymap.set("n", "<leader>gh", require("gitsigns").stage_hunk, { desc = "[G]itsign Stage [H]unk" })
    vim.keymap.set("n", "<leader>gs", require("gitsigns").show, { desc = "[G]itsign [S]how" })
  end,
}
