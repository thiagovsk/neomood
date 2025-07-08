# Tmux Workflow Integration

Tmux is a **critical component** of the NeoMood workflow.
This configuration creates a seamless integration between Alacritty terminal, tmux, and Neovim,
providing a powerful development environment that bypasses traditional tmux prefix keys for maximum efficiency.

## Why Tmux + Alacritty?

The combination of Alacritty and tmux provides:

- **Prefix-free workflow**: Direct key bindings without `Ctrl-b` prefix for common operations
- **Seamless pane navigation**: Same keys work in tmux panes and Neovim splits
- **Session persistence**: Keep your work sessions across terminal restarts
- **Multi-project management**: Easy switching between different projects
- **Terminal multiplexing**: Multiple terminals in organized layouts

## Installation & Setup

### 1. Install Required Components

**Ubuntu/Debian:**
```bash
sudo apt install tmux alacritty
```

**Arch Linux:**
```bash
sudo pacman -S tmux alacritty
```

**macOS:**
```bash
brew install tmux alacritty
```

### 2. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 3. Copy Configuration Files

```bash
# Copy tmux configuration (your neomood path can be different)
cp ~/.config/nvim/extra/.tmux.conf ~/.tmux.conf 

# Copy Alacritty configuration
mkdir -p ~/.config/alacritty
cp ~/.config/nvim/extra/alacritty.toml ~/.config/alacritty/alacritty.toml
```

### 4. Install Tmux Plugins

1. Start tmux: `tmux`
2. Install plugins: `Ctrl+x` + `I` (capital i)
3. Wait for plugins to install

### 5. Configure Your Nerd Font

Edit `~/.config/alacritty/alacritty.toml` and update the font family:

```toml
[font.normal]
family = "Your Nerd Font Name"  # e.g., "JetBrains Mono Nerd Font"
```

## Key Mappings Reference

*Note: M = Alt/Option key, C = Control key, S = Shift key*

### Navigation & Search

| Command | Description |
|---------|-------------|
| `M-/` | Search in tmux history |
| `M-o` | Go to next pane |
| `M-1` to `M-9` | Switch to window 1-9 |
| `M-a` | Alternate between current and last window |
| `M-,` | Go to previous pane / nvim split |
| `M-;` | Go to next pane / nvim split |
| `M-Esc` | Go to next pane and maximize |

### Session Management

| Command | Description |
|---------|-------------|
| `M-S-a` | Show all sessions (press `x` to close one) |
| `M-S-n` | Next session |
| `M-S-p` | Previous session |
| `M-S-d` | Detach tmux session |

### Text Search & Copy

| Command | Description |
|---------|-------------|
| `M-S-f` | Search text in terminal and copy/insert (very useful for copying IDs or command output) |

### Window & Pane Management

| Command | Description |
|---------|-------------|
| `M-RET` | Maximize/restore pane |
| `M-S-v` | Split vertically |
| `M-S-s` | Split horizontally |
| `M-S-h/j/k/l` | Resize pane in direction |
| `M-t` | New window |
| `M-S-t` | New session |
| `M-j` | Join current window to another as pane |
| `M-k` | Detach current pane as new window |
| `M-x` | Close window/pane |
| `M-i` | Switch pane orientation |
| `M-S-i` | Switch windows |

## Neovim Integration

The configuration includes special handling for Neovim:

- Seamless navigation between tmux and Neovim
- Tmux-aware commands in NeoMood (see tmux-awesome-manager plugin)

### NeoMood Tmux Commands

Available through `<leader>l` prefix:

- `<leader>gg` - LazyGit in tmux
- `<leader>rr` - Rails console
- `<leader>ll` - List open terminals
- `<leader>lf` - Search commands
- `<leader>lk` - Kill all terminals

## Configuration Files

### Alacritty Configuration (`extra/alacritty.toml`)

The provided configuration includes:

- **Catppuccin color scheme** matching NeoMood
- **Optimized key bindings** for tmux integration
- **Nerd Font support** for icons
- **Command/Alt key mappings** for both macOS and Linux

Key features:
- Bypass tmux prefix for common operations
- Unified key bindings across platforms
- Color scheme matching Neovim theme

### Tmux Configuration (`extra/.tmux.conf`)

The provided configuration includes:

- **TPM plugins**: sensible, extrakto, copycat, sessionist, catppuccin
- **Catppuccin theme** matching NeoMood colors
- **Prefix changed to `C-x`** (instead of default `C-b`)
- **Vi-mode key bindings**
- **Smart pane navigation** with Neovim integration
- **Mouse support** for clicking and resizing

Key features:
- Status bar on top with session info
- Window numbering starts at 1
- Automatic window renumbering
- Copy-paste integration with system clipboard

## Workflow Tips

### 1. Session Management
```bash
# Create named session
tmux new -s project-name

# Attach to session
tmux attach -t project-name

# List sessions
tmux ls
```

### 2. Project Workflow
1. Create tmux session for each project
2. Use `M-S-t` to create new sessions quickly
3. Use `M-S-a` to switch between projects
4. Use `M-1` to `M-9` for quick window switching

### 3. Development Layout
- Window 1: Editor (Neovim)
- Window 2: Rails console (`<leader>rr`)
- Window 3: Test runner
- Window 4: Git operations (`<leader>gg`)

### 4. Copy-Paste Workflow
- Use `M-S-f` to search and copy terminal output
- Use tmux copy mode with `C-x` + `[`
- Visual selection with `v`, copy with `y`

## Troubleshooting

### Colors Not Working
- Ensure your terminal supports 256 colors
- Check Alacritty configuration: `TERM = "xterm-256color"`
- Verify tmux color settings: `set -g default-terminal "tmux-256color"`

### Key Bindings Not Working
- Confirm Alacritty is using the provided configuration
- Check tmux configuration is loaded: `tmux source ~/.tmux.conf`
- Verify TPM plugins are installed: `C-x` + `I`

### Font Issues
- Install a Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/)
- Update Alacritty configuration with correct font family name
- Restart Alacritty after font changes

```

## Tmux Awesome Manager - The Power Behind the Workflow

The [tmux-awesome-manager](https://github.com/otavioschwanck/tmux-awesome-manager.nvim) plugin is the heart of NeoMood's terminal integration, providing:

### Core Features
- **Project-specific commands**: Define custom commands per project
- **Session management**: Create and switch between project sessions seamlessly
- **Code execution**: Send visual selections or entire files to tmux panes
- **Terminal management**: List, create, and kill terminal sessions
- **Custom key mappings**: Map any command to any key combination

### Key Mappings
- `<leader>lf` - Search and execute project commands
- `<leader>l` (Visual) - Send visual selection to tmux terminal
- `<leader>ll` - List and switch between open terminals
- `<leader>lk` - Kill all terminal sessions
- `<leader>#` - Run all project-defined startup commands

### Pre-configured Development Commands
- `<leader>gg` - LazyGit in tmux window
- `<leader>rr` - Rails console in tmux window
- `<leader>rb` - Bundle install (auto-closes after 2s)
- `<leader>rg` - Rails generate (prompts for generator type)
- `<leader>rd` - Rails destroy (prompts for what to destroy)
- `<leader>ri` - Rails db:migrate (auto-closes after 4s)
- `<leader>oy` - Yarn install
- `<leader>+` - Run Rubocop auto-fix (auto-closes after 2s)

### Configuration Options

**1. Per-Project Commands** (in `lua/plugins/tmux-awesome-manager.lua`):
```lua
per_project_commands = {
  my_project = { { cmd = "rails s", name = "rails server" } },
  frontend = { { cmd = "yarn dev", name = "dev server" } },
}
```

**2. Custom Key Mappings** (like the Rails console example):
```lua
set("<leader>rr", {
  cmd = "rails console",
  name = "rails console",
  open_as = "window",
  visit_first_call = true,
})
```

**3. Interactive Commands** (with prompts):
```lua
set("<leader>rg", {
  cmd = "rails generate %1",
  name = "Rails Generate",
  questions = {
    { question = "Rails generate: ", required = true }
  },
})
```

### Command Options
- `cmd` - The command to run
- `name` - Display name for the command
- `open_as` - "window", "pane", or "separated_session"
- `visit_first_call` - Whether to focus the terminal on first run
- `close_on_timer` - Auto-close after N seconds
- `focus_when_call` - Whether to focus when running
- `questions` - Interactive prompts for command parameters

### Workflow Power
- **Code Testing**: Select Ruby code and send it directly to a Rails console
- **Custom Commands**: Map any terminal command to a key combination
- **Multi-terminal Workflow**: Run server, console, tests, and git in separate panes
- **Project Context**: Different commands available per project
- **Seamless Integration**: All terminal operations accessible from within Neovim

The tmux + Alacritty + tmux-awesome-manager combination transforms NeoMood from a simple editor into a complete development environment, providing unmatched efficiency for Rails and JavaScript development workflows.
