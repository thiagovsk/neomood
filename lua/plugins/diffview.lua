return {
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gd", ":DiffviewFileHistory %<CR>:echo 'Use SPC q d or :DiffviewClose to quit.'<CR>", desc = "Current File History" },
      { "<leader>gh", ":DiffviewFileHistory<CR>:echo 'Use SPC q d or :DiffviewClose to quit.'<CR>",   desc = "Commits History" },
      { "<leader>qd", ":DiffviewClose<CR>",                                                           desc = "Close Diffview" },
    }
  },
}
