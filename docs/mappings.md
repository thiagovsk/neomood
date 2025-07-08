# Key Mappings Reference

This document provides a comprehensive reference of all key mappings in NeoMood, organized by category and source.

## Core Mappings (mappings.lua)

### Basic Editor Operations
- `\` - Save all files (`:wall`)
- `-` - Jump to end of line (`$`)
- `,` - Switch between windows (`<C-w>w`)
- `<C-w>,` - Switch between windows (reverse)
- `<C-e>` - Switch to alternate buffer
- `ge` - Switch to alternate buffer
- `x` - Delete character (no yank)
- `<leader>qq` - Quit all (`:qall`)
- `<Esc>` - Clear search highlight

### Text Manipulation
- `gw` - Change word under cursor (search and replace)
- `J` (Visual) - Move selected lines down
- `K` (Visual) - Move selected lines up
- `yb` - Yank entire buffer to clipboard
- `<` (Visual) - Outdent and keep selection
- `>` (Visual) - Indent and keep selection

### Command Mode Navigation
- `<C-h>` - Move left
- `<C-l>` - Move right
- `<C-k>` - Move word right
- `<C-j>` - Move word left
- `<C-a>` - Move to beginning
- `<C-e>` - Move to end
- `<C-d>` - Delete character

### File Management
- `<leader>fC` - Copy file
- `<leader>fM` - Move file
- `<leader>fd` - Delete file
- `<leader>fD` - Delete file (force)
- `<leader>fR` - Rename file
- `<leader>fy` - Copy relative path
- `<leader>fl` - Copy relative path with line number
- `<leader>fY` - Copy full path
- `<leader>fp` - Open dotfiles

### Rails Development
- `<leader>rm` - Find Model
- `<leader>rq` - Find Contracts
- `<leader>rz` - Find Serializers
- `<leader>rc` - Find Controller
- `<leader>rv` - Find View
- `<leader>ra` - Find Locales
- `<leader>ru` - Find Factories
- `<leader>rs` - Find Services
- `<leader>rS` - Find Business
- `<leader>rn` - Find Migration
- `<leader>ro` - Find Avo Resource
- `<leader>rj` - Find Jobs
- `<leader>rI` - Reset Rails database
- `<leader>rK` - Kill Ruby instances

### Window Management
- `<leader>wq` - Close window
- `<leader>wj` - Move to window below
- `<leader>wk` - Move to window above
- `<leader>wh` - Move to window left
- `<leader>wl` - Move to window right
- `<leader>wo` - Close other windows

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `]q` - Next quickfix item
- `[q` - Previous quickfix item

### Helper Commands
- `<leader>hD` - Delete swap files
- `<leader>hr` - Restart LSP
- `<leader>to` - Open quickfix output

## Plugin Mappings

### Arrow Navigation - [otavioschwanck/arrow.nvim](https://github.com/otavioschwanck/arrow.nvim)
- `;` Open Arrow Menu
- `H` - Previous Arrow bookmark
- `L` - Next Arrow bookmark
- `m` - Per buffer bookmark

### Code Completion with IA (Codeium) - [Exafunction/codeium.vim](https://github.com/Exafunction/codeium.vim)
- `<C-f>` (Insert) - Accept next word
- `<C-j>` (Insert) - Accept completion
- `<C-b>` (Insert) - Cycle completions
- `<C-]>` (Insert) - Clear completion

### CMP Completion (auto complete) - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- `<Tab>` - Select next item
- `<S-Tab>` - Select previous item
- `<CR>` - Confirm selection
- `<C-e>` - Complete
- `<C-u>` - Scroll docs up
- `<C-d>` - Scroll docs down

### Flash Jump - [folke/flash.nvim](https://github.com/folke/flash.nvim)
- `s` - Flash jump
- `r` (Operator) - Remote Flash
- `R` (Operator/Visual) - Treesitter Search
- `<C-s>` (Command) - Toggle Flash Search

### File Explorer - [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- `<leader>e` - Toggle Neo-tree
- `<leader>E` - Open current file in Neo-tree

### FZF Explorer - [otavioschwanck/fzf-lua-explorer.nvim](https://github.com/otavioschwanck/fzf-lua-explorer.nvim)
- `<leader>.` - FZF Explorer

### FZF-Lua (Fuzzy Finding) - [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
- `<leader><space>` - Find files
- `<leader>sp` - Live grep
- `<leader>sh` - Help tags
- `<leader>sr` - Recent files
- `<leader>,` - Buffers
- `<leader><cr>` - Resume FZF
- `<leader><tab>` - Git status
- `<leader>sd` - Live grep on current folder
- `<leader>sD` - Live grep on specific folder

### Git Operations - [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- `]g` - Next git hunk
- `[g` - Previous git hunk
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gS` - Stage buffer
- `<leader>gu` - Undo stage hunk
- `<leader>gR` - Reset buffer
- `<leader>gp` - Preview hunk
- `<leader>gb` - Blame line
- `ih` - Select hunk (text object)

### Git Blame - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- `<leader>gB` - Git blame (fugitive)

### LSP Operations - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- `K` - Show hover information
- `gd` - Go to definition
- `gD` - Go to declaration
- `gI` - Go to implementations
- `gt` - Go to type definitions
- `gr` - Go to references
- `gK` - Signature help
- `<leader>ca` - Code action
- `gl` - Show diagnostics
- `<gr>` - Rename symbol

### Buffer Management - [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove)
- `<leader>k` - Delete buffer
- `<leader>bD` - Delete buffer (force)

### Multiple Cursors - [jake-stewart/multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim)
- `<C-k>` - Add cursor above
- `<C-j>` - Add cursor below
- `<leader><C-k>` - Skip cursor above
- `<leader><C-j>` - Skip cursor below
- `<M-d>` - Match add cursor
- `<C-n>` - Match add cursor
- `<C-q>` - Match skip cursor
- `<c-leftmouse>` - Handle mouse
- `<left>` - Previous cursor (when multiple active)
- `<right>` - Next cursor (when multiple active)
- `<leader>x` - Delete cursor (when multiple active)
- `<esc>` - Toggle/clear cursors (when multiple active)

### Notes (Obsidian) - [epwalsh/obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)
- `<leader>sn` - Search notes
- `<leader>bn` - New note

### Search and Replace - [roobert/search-replace.nvim](https://github.com/roobert/search-replace.nvim)
- `gq` (Visual) - Search replace in selection
- `gq` (Normal) - Search replace current word
- `gQ` - Search replace expression

### Global Search Replace - [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- `<leader>sR` - Replace in files (Spectre)

### Case Conversion - [nicwest/vim-camelsnek](https://github.com/nicwest/vim-camelsnek)
- `<leader>ccs` - Convert to snake_case
- `<leader>ccc` - Convert to CamelCase
- `<leader>ccb` - Convert to camelCaseB

### Telescope Alternate - [otavioschwanck/telescope-alternate.nvim](https://github.com/otavioschwanck/telescope-alternate.nvim)
- `<leader>fa` - Alternate files

### Testing - [vim-test/vim-test](https://github.com/vim-test/vim-test)
- `<leader>ts` - Test nearest
- `<leader>tf` - Re-run failed tests
- `<leader>tv` - Test file
- `<leader>tb` - Go to backtrace
- `<leader>ta` - Test suite
- `<leader>tr` - Test last

### Tmux Integration - [otavioschwanck/tmux-awesome-manager.nvim](https://github.com/otavioschwanck/tmux-awesome-manager.nvim)
- `<leader>lf` - Search commands
- `<leader>l` (Visual) - Send text to tmux
- `<leader>ll` - Search open terminals
- `<leader>lk` - Kill all terms
- `<leader>gg` - LazyGit
- `<leader>rr` - Rails console
- `<leader>oy` - Yarn install
- `<leader>oYc` - Yarn check-translations
- `<leader>#` - Run project terms
- `<leader>+` - Rubocop
- `<leader>rb` - Bundle install
- `<leader>rg` - Rails generate
- `<leader>rd` - Rails destroy
- `<leader>ri` - Rails db:migrate

### Treesitter - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- `g]f` - Swap next function
- `g[f` - Swap previous function

### Argument Manipulation - [AndrewRadev/sideways.vim](https://github.com/AndrewRadev/sideways.vim)
- `]a` - Sideways jump right
- `[a` - Sideways jump left
- `g]a` - Sideways right
- `g[a` - Sideways left
- `aa` - Sideways argument textobj A
- `ia` - Sideways argument textobj I

### Undo Tree - [mbbill/undotree](https://github.com/mbbill/undotree)
- `<leader>u` - Toggle undo tree

### Yank Management - [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim)
- `p` - Yanky put after
- `P` - Yanky put before
- `y` - Yanky yank
- `<C-p>` - Yanky cycle forward
- `g<C-p>` - Yanky cycle backward

## Tips

1. **Leader Key**: The leader key is `<space>` by default
2. **Which-key**: Press `<leader>` and wait to see available mappings
3. **Help**: Use `:help` followed by a key combination to get more information
4. **Custom Mappings**: Add your own mappings in `lua/neomood/mappings.lua`

## Mode Abbreviations

- `n` - Normal mode
- `i` - Insert mode
- `v` - Visual mode
- `x` - Visual mode (exclusive)
- `c` - Command mode
- `o` - Operator-pending mode
