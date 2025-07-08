local M = {}

local fzf = require("fzf-lua")

local dotfiles = {
  "~/.zshrc", -- add your dotfiles here. Then, access it with SPC f p
  "~/.config/alacritty/alacritty.toml",
  "~/.tmux.conf",
}

function M.call(files)
  fzf.fzf_exec(files, {
    prompt = "User Files > ",
    previewer = "builtin",
    actions = {
      ['default'] = function(selected)
        local path = selected[1]
        vim.cmd("edit " .. vim.fn.fnameescape(path))
      end,
    },
  })
end

function M.open_dotfiles()
  M.call(dotfiles)
end

return M
