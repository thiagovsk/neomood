return {
  {
    'fredeeb/tardis.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
    opts = {
      keymap = {
        ["next"] = '<C-j>',                  -- next entry in log (older)
        ["prev"] = '<C-k>',                  -- previous entry in log (newer)
        ["quit"] = 'q',                      -- quit all
        ["revision_message"] = '<leader>gm', -- show revision message for current revision
        ["commit"] = '<C-g>',                -- replace contents of origin buffer with contents of tardis buffer
      },
    },
    keys = {
      { "<leader>gt", "<cmd>Tardis git<CR>", desc = "Git Time Machine" },
    }
  }
}
