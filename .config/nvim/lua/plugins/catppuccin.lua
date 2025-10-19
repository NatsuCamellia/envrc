return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      -- Allow the macOS terminal to use transparent background,
      -- without this setting on, it became ugly.
      transparent_background = true,
      integrations = {
        gitsigns = true,
      },
    }

    -- Load the theme
    vim.cmd.colorscheme 'catppuccin'
  end,
}
