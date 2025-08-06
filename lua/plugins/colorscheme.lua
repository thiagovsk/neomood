return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    commit = "fa42eb5e26819ef58884257d5ae95dd0552b9a66",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        custom_highlights = function()
          return {
            NormalFloat = { link = "Normal" },
          }
        end,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
