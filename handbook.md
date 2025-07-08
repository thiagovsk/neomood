# NeoMood Quick Reference Handbook

This handbook provides quick access to the most important mappings and commands in NeoMood.

## Essential Mappings

### Leader Key
- **Leader**: `<space>`

### File Operations
- `<leader><space>` - Find files
- `<leader>e` - Toggle file explorer
- `<leader>.` - FZF Explorer
- `\` - Save all files
- `<leader>k` - Delete buffer

### Navigation
- `<leader>,` - Switch buffers
- `<leader>sp` - Live grep
- `<leader>sr` - Recent files
- `H` / `L` - Arrow bookmarks (previous/next)
- `ge` - Switch to alternate buffer

### Git
- `<leader>gs` - Stage hunk
- `<leader>gb` - Blame line
- `<leader>gg` - LazyGit
- `<leader>gB` - Git blame (full)
- `]g` / `[g` - Next/previous hunk
- `<leader><tab>` - Git status

### LSP & Code
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover info
- `<leader>ca` - Code actions
- `<leader>hr` - Restart LSP
- `gl` - Show diagnostics
- `]d` / `[d` - Next/previous diagnostic

### Testing
- `<leader>ts` - Test nearest
- `<leader>tf` - Re-run failed tests
- `<leader>tv` - Test file
- `<leader>ta` - Test suite

### Rails Development
- `<leader>rm` - Find Model
- `<leader>rc` - Find Controller
- `<leader>rv` - Find View
- `<leader>rs` - Find Service
- `<leader>rr` - Rails console
- `<leader>ri` - Rails db:migrate

### Search & Replace
- `<leader>sp` - Live grep
- `<leader>sw` - Grep word at cursor / visual selection
- `<leader>sd` - Live grep current folder
- `<leader>ss` - Search in current buffer
- `<leader>so` - Search in all open buffers
- `<leader>sR` - Replace in files (Spectre)
- `gq` - Search replace word/selection

### Text Manipulation
- `gw` - Change word under cursor
- `J` / `K` (Visual) - Move lines up/down
- `<` / `>` (Visual) - Indent/outdent
- `p` / `P` - Paste with yanky
- `<C-p>` - Cycle yanks

### Multiple Cursors
- `<C-j>` / `<C-k>` - Add cursor below/above
- `<C-n>` - Add cursor on match
- `<C-q>` - Skip cursor on match

### Snippets
- `<C-N>` - Expand snippet or jump to next placeholder
- `<C-P>` - Jump to previous placeholder

### Tmux Integration
- `<leader>gg` - LazyGit
- `<leader>ll` - List terminals
- `<leader>l` (Visual) - Send to terminal

## Quick Commands

### System
- `:checkhealth` - Check system health
- `:Lazy` - Plugin manager
- `:Mason` - LSP installer

### File Management
- `<leader>fC` - Copy file
- `<leader>fM` - Move file
- `<leader>fd` - Delete file
- `<leader>fR` - Rename file
- `<leader>fy` - Copy relative path

### Window Management
- `<leader>wq` - Close window
- `<leader>wh/j/k/l` - Move between windows
- `<leader>wo` - Close other windows

## Quick Tips

1. **Search Files**: `<leader><space>` is your main file finder
2. **Search Content**: `<leader>sp` for project-wide search
3. **Git Workflow**: Use `<leader>gs` to stage hunks, `<leader>gb` for blame
4. **Rails Navigation**: Use `<leader>r` prefix for Rails-specific navigation
5. **Testing**: `<leader>ts` for nearest test, `<leader>tf` for failed tests
6. **LSP**: `gd` for definition, `gr` for references, `K` for documentation
7. **Quick Edit**: `gw` to change word under cursor quickly

## Other Commands

- `<leader>qq` - Quit all
- `<leader>hD` - Delete swap files
- `<leader>hr` - Restart LSP
- `<leader>rK` - Kill Ruby instances
- `<leader>lk` - Kill all terminals

## Custom Text Objects

- `aa` / `ia`  Inside/outside arguments
- `ih` - Git hunk
- `vq` - Quotes content
- `vij` - Indentation block

## Modes Quick Reference

- **Normal**: Default mode for navigation and commands
- **Insert**: `i` to enter, `<Esc>` to exit
- **Visual**: `v` for character-wise, `V` for line-wise
- **Command**: `:` to enter

## Getting Help

- `<leader>` + wait - See available key mappings
- `:help <command>` - Get help for specific commands
- [Documentation](docs/) - Full documentation (SPC h h)
- [Tmux Workflow](docs/tmux-workflow.md) - Essential development environment setup
- [Mappings](docs/mappings.md) - Complete key mappings reference
- [Plugins](docs/plugins.md) - Plugin documentation

---

*This handbook covers the most frequently used mappings. For a complete reference, see the [full mappings documentation](docs/mappings.md).*
