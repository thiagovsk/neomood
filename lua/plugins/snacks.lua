return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      lazygit = {
      }
    },
    keys = {
      { "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>",          desc = "LazyGit" },
      { "<leader>gl", "<cmd>lua Snacks.lazygit.log_file()<cr>", desc = "LogFile with LazyGit" },
    }
  }
}
