local M = {}

local scan = require("plenary.scandir")

function M.filename_first(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)

  if parent == "." then return tail end

  return string.format("%s\t\t%s", tail, parent)
end

function M.live_grep_on_folder(opts)
  opts = opts or {}
  local data = {}
  scan.scan_dir(vim.loop.cwd(), {
    hidden = opts.hidden,
    only_dirs = true,
    respect_gitignore = opts.respect_gitignore,
    on_insert = function(entry)
      table.insert(data, entry)
    end,
  })
  table.insert(data, 1, ".")

  require("fzf-lua").fzf_exec(data, {
    prompt = "Select folder(s) for Live Grep> ",
    fzf_opts = { ["--multi"] = true },
    actions = {
      ["default"] = function(selected)
        require("fzf-lua").live_grep({
          search_paths = selected,
        })
      end,
    },
  })
end

return M
