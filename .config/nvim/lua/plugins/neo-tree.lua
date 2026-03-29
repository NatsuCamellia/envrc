return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  keys = {
    { "<leader>ne", "<cmd>Neotree toggle<cr>" },
    { "<leader>nb", "<cmd>Neotree buffers toggle<cr>" },  -- buffer source
    { "<leader>ng", "<cmd>Neotree git_status toggle<cr>" }, -- git source
  },
  lazy = false,                                          -- neo-tree will lazily load itself
}
