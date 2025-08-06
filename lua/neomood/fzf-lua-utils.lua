local M = {}

function M.filename_first(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)

  if parent == "." then return tail end

  return string.format("%s\t\t%s", tail, parent)
end

function M.live_grep_on_folder(opts)
  opts = opts or {}
  local cwd = vim.fn.getcwd()

  -- Use find command to get all directories recursively
  -- Only exclude hidden dirs if we're not already in one
  local exclude_hidden = not cwd:match('/%.') and '-not -path "*/.*"' or ''
  local find_cmd = 'find "' .. cwd .. '" -type d ' .. exclude_hidden .. ' 2>/dev/null'
  local find_result = vim.fn.system(find_cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify('Failed to find folders', vim.log.levels.ERROR)
    return
  end

  local folders = {}
  -- Add current directory first
  table.insert(folders, ".")
  
  for folder in find_result:gmatch('[^\r\n]+') do
    if folder ~= cwd then -- Skip the root directory
      -- Make paths relative to cwd for display
      local relative_path = folder:gsub('^' .. vim.pesc(cwd) .. '/?', '')
      if relative_path ~= '' then
        table.insert(folders, relative_path)
      end
    end
  end

  if #folders <= 1 then -- Only "." remains
    vim.notify('No folders found in ' .. cwd, vim.log.levels.WARN)
    return
  end

  -- Sort folders alphabetically (skip first element which is ".")
  local folders_to_sort = {}
  for i = 2, #folders do
    table.insert(folders_to_sort, folders[i])
  end
  table.sort(folders_to_sort)
  
  -- Reconstruct with "." first
  local sorted_folders = {"."}
  for _, folder in ipairs(folders_to_sort) do
    table.insert(sorted_folders, folder)
  end

  require("fzf-lua").fzf_exec(sorted_folders, {
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
