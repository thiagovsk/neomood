return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_filetypes = { TelescopePrompt = false }

      -- Accept completions
      vim.keymap.set("i", "<C-j>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, desc = "Accept Codeium suggestion" })

      -- Accept next word
      vim.keymap.set("i", "<C-f>", function()
        return vim.fn["codeium#AcceptNextWord"]()
      end, { expr = true, desc = "Accept next word from Codeium" })

      -- Accept next line
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#AcceptNextLine"]()
      end, { expr = true, desc = "Accept next line from Codeium" })

      -- Cycle through completions
      vim.keymap.set("i", "<C-b>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, desc = "Cycle to next Codeium completion" })

      -- Clear completions
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, desc = "Clear Codeium suggestions" })

      -- Manual trigger
      vim.keymap.set("i", "<C-u>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true, desc = "Manually trigger Codeium completion" })
    end,
  },
}
