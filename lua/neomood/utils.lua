local M = {}

function M.t(map, func, desc)
  vim.keymap.set("t", map, func, { silent = true, noremap = true, desc = desc or "" })
end

function M.c(map, func)
  vim.keymap.set("c", map, func)
end

function M.n(map, func, desc)
  vim.keymap.set("n", map, func, { silent = true, noremap = true, desc = desc or "" })
end

function M.n_buf(map, func, desc, buf)
  vim.keymap.set("n", map, func, { silent = true, noremap = true, desc = desc or "", buffer = buf })
end

function M.v(map, func, desc)
  vim.keymap.set({ "v", "x" }, map, func, { silent = true, noremap = true, desc = desc or "" })
end

function M.nv(map, func, desc)
  vim.keymap.set({ "v", "n" }, map, func, { silent = true, noremap = true, desc = desc or "" })
end

function M.x(map, func, desc)
  vim.keymap.set("x", map, func, { silent = true, noremap = true, desc = desc or "" })
end

function M.v_buf(map, func, desc, buf)
  vim.keymap.set("v", map, func, { silent = true, noremap = true, desc = desc or "", buffer = buf })
end

function M.debug_info()
  print("=== NEOVIM DEBUG INFO ===")
  print("Timestamp:", os.date("%Y-%m-%d %H:%M:%S"))
  print("Uptime (approx):", vim.g.start_time and (vim.fn.localtime() - vim.g.start_time) or "unknown")
  print("Memory (KB):", collectgarbage("count"))
  print("Loaded modules:", vim.tbl_count(package.loaded))
  print("Buffer count:", #vim.api.nvim_list_bufs())
  print("Window count:", #vim.api.nvim_list_wins())
  print("Tabpage count:", #vim.api.nvim_list_tabpages())
  print("Neovim version:", vim.fn.has('nvim'))
  print("PID:", vim.fn.getpid())
  
  -- Memory details
  print("\n=== MEMORY DETAILS ===")
  print("Lua memory before GC:", collectgarbage("count"), "KB")
  local before_gc = collectgarbage("count")
  collectgarbage("collect")
  local after_gc = collectgarbage("count")
  print("Lua memory after GC:", after_gc, "KB")
  print("Memory freed by GC:", before_gc - after_gc, "KB")
  
  -- Process info
  print("\n=== PROCESS INFO ===")
  local handle = io.popen("ps -p " .. vim.fn.getpid() .. " -o pid,ppid,pcpu,pmem,vsz,rss,tty,stat,start,time,comm")
  if handle then
    local result = handle:read("*a")
    handle:close()
    print(result)
  end
  
  -- Terminal/Job info
  print("\n=== TERMINAL & JOBS ===")
  local term_bufs = {}
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    local buf_type = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buf_type == 'terminal' then
      table.insert(term_bufs, buf)
    end
  end
  print("Terminal buffers:", #term_bufs)
  for _, buf in ipairs(term_bufs) do
    local name = vim.api.nvim_buf_get_name(buf)
    print(string.format("  Terminal buf %d: %s", buf, name))
  end
  
  -- Snacks info
  print("\n=== SNACKS INFO ===")
  if package.loaded["snacks"] then
    print("Snacks loaded: YES")
    local snacks = require("snacks")
    if snacks.config then
      print("Snacks config loaded: YES")
    end
    if package.loaded["snacks.terminal"] then
      print("Snacks terminal loaded: YES")
    end
    if package.loaded["snacks.lazygit"] then
      print("Snacks lazygit loaded: YES")
    end
  else
    print("Snacks loaded: NO")
  end
  
  -- Autocmds that might affect performance
  print("\n=== AUTOCMDS ===")
  local autocmds = vim.api.nvim_get_autocmds({})
  local autocmd_count = {}
  for _, au in ipairs(autocmds) do
    local event = au.event
    autocmd_count[event] = (autocmd_count[event] or 0) + 1
  end
  print("Total autocmds:", #autocmds)
  for event, count in pairs(autocmd_count) do
    if count > 10 then -- Show only events with many handlers
      print(string.format("  %s: %d handlers", event, count))
    end
  end
  
  -- Buffers detalhados
  print("\n=== BUFFERS DETAILED ===")
  for _, buf in ipairs(buffers) do
    local name = vim.api.nvim_buf_get_name(buf)
    local loaded = vim.api.nvim_buf_is_loaded(buf)
    local modified = vim.api.nvim_buf_get_option(buf, 'modified')
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
    local line_count = vim.api.nvim_buf_line_count(buf)
    print(string.format("Buf %d: %s", buf, name ~= "" and name or "[No Name]"))
    print(string.format("  loaded:%s, modified:%s, type:%s, ft:%s, lines:%d", 
          loaded, modified, buftype, filetype, line_count))
  end
  
  -- LSP info
  print("\n=== LSP CLIENTS ===")
  local clients = vim.lsp.get_active_clients()
  print("Active LSP clients:", #clients)
  for _, client in ipairs(clients) do
    print(string.format("  LSP: %s (id:%d, pid:%s)", client.name, client.id, client.config.cmd and client.config.cmd[1] or "unknown"))
  end
  
  -- Plugin info
  print("\n=== PLUGINS ===")
  if package.loaded["lazy"] then
    local lazy = require("lazy")
    local plugins = lazy.plugins()
    print("Lazy plugins loaded:", vim.tbl_count(plugins))
    
    -- Show plugins that are likely to affect terminal performance
    local perf_plugins = {"snacks", "toggleterm", "terminal", "lazygit", "floaterm"}
    for _, plugin_name in ipairs(perf_plugins) do
      for name, plugin in pairs(plugins) do
        if type(name) == "string" and string.find(name:lower(), plugin_name) then
          print(string.format("  %s: %s", name, plugin.loaded and "LOADED" or "not loaded"))
        end
      end
    end
  end
  
  -- System resources
  print("\n=== SYSTEM RESOURCES ===")
  local meminfo = io.open("/proc/meminfo", "r")
  if meminfo then
    local mem_total, mem_free, mem_available
    for line in meminfo:lines() do
      if line:match("^MemTotal:") then
        mem_total = line:match("(%d+)")
      elseif line:match("^MemFree:") then
        mem_free = line:match("(%d+)")
      elseif line:match("^MemAvailable:") then
        mem_available = line:match("(%d+)")
        break
      end
    end
    meminfo:close()
    if mem_total then
      print(string.format("System Memory: %d MB total, %d MB free, %d MB available", 
            math.floor(mem_total/1024), math.floor(mem_free/1024), math.floor(mem_available/1024)))
    end
  end
  
  -- Git repo info
  print("\n=== GIT INFO ===")
  local git_dir = vim.fn.finddir(".git", ".;")
  if git_dir ~= "" then
    print("Git repo: YES")
    local handle = io.popen("git status --porcelain 2>/dev/null | wc -l")
    if handle then
      local changes = handle:read("*n")
      handle:close()
      print("Git changes:", changes or "unknown")
    end
    
    local handle = io.popen("git log --oneline | wc -l 2>/dev/null")
    if handle then
      local commits = handle:read("*n")
      handle:close()
      print("Git commits:", commits or "unknown")
    end
  else
    print("Git repo: NO")
  end
  
  print("\n=== ENVIRONMENT ===")
  print("TERM:", os.getenv("TERM") or "unknown")
  print("SHELL:", os.getenv("SHELL") or "unknown")
  print("TMUX:", os.getenv("TMUX") and "YES" or "NO")
  print("SSH_TTY:", os.getenv("SSH_TTY") and "YES" or "NO")
  
  print("\n=== END DEBUG ===")
end

return M
