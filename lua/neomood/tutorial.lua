local M = {}

--- Opens the NeoMood tutorial in the selected language
function M.open_tutorial()
  local fzf = require("fzf-lua")
  
  local options = {
    "🇺🇸 English",
    "🇧🇷 Português"
  }
  
  fzf.fzf_exec(options, {
    prompt = "Select Tutorial Language > ",
    preview_window = "hidden",
    actions = {
      ["default"] = function(selected)
        if not selected or #selected == 0 then
          return
        end
        
        local selection = selected[1]
        local file_path
        
        if selection:match("English") then
          file_path = vim.fn.stdpath("config") .. "/docs/new_on_vim.md"
        else
          file_path = vim.fn.stdpath("config") .. "/docs/new_on_vim_pt.md"
        end
        
        M.create_tutorial_buffer(file_path)
      end
    }
  })
end

--- Creates a scratch buffer with tutorial content
--- @param file_path string Path to the tutorial file
function M.create_tutorial_buffer(file_path)
  -- Check if file exists
  if vim.fn.filereadable(file_path) == 0 then
    vim.notify("Tutorial file not found: " .. file_path, vim.log.levels.ERROR)
    return
  end
  
  -- Read file content
  local content = {}
  for line in io.lines(file_path) do
    table.insert(content, line)
  end
  
  -- Create new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Set buffer content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  
  -- Set buffer options to make it a scratch buffer
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  
  -- Generate a unique name for the buffer
  local uuid = M.generate_uuid()
  local buffer_name = "NeoMood Tutorial [" .. uuid .. "]"
  vim.api.nvim_buf_set_name(buf, buffer_name)
  
  -- Open buffer in current window
  vim.api.nvim_set_current_buf(buf)
  
  -- Set window options for better tutorial experience
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true
  vim.opt_local.conceallevel = 2
  vim.opt_local.concealcursor = "nc"
  
  -- Add buffer-local keymaps for convenience
  local opts = { buffer = buf, silent = true }
  vim.keymap.set("n", "q", "<cmd>bdelete<cr>", opts)
  vim.keymap.set("n", "<leader>q", "<cmd>bdelete<cr>", opts)
  
  -- Notify user
  vim.notify("📚 NeoMood Tutorial opened in scratch buffer. Press 'q' to close.", vim.log.levels.INFO)
  
  -- Go to top of file
  vim.api.nvim_win_set_cursor(0, {1, 0})
end

--- Generates a simple UUID-like string
--- @return string
function M.generate_uuid()
  local random = math.random
  local template = "xxxxxxxx"
  return string.gsub(template, "[x]", function()
    return string.format("%x", random(0, 0xf))
  end)
end

--- Quick function to open English tutorial directly
function M.open_english_tutorial()
  local file_path = vim.fn.stdpath("config") .. "/docs/new_on_vim.md"
  M.create_tutorial_buffer(file_path)
end

--- Quick function to open Portuguese tutorial directly
function M.open_portuguese_tutorial()
  local file_path = vim.fn.stdpath("config") .. "/docs/new_on_vim_pt.md"
  M.create_tutorial_buffer(file_path)
end

return M