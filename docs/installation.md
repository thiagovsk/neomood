# Installation Guide

This guide provides detailed installation instructions for NeoMood on different operating systems.

## Prerequisites

Before installing NeoMood, ensure you have:

- **Neovim 0.11+**
- **Git** for cloning the repository
- **Internet connection** for downloading plugins

## System Requirements

### Required Dependencies

- **ripgrep (rg)** - Fast file searching
- **Python 3** with neovim package
- **Ruby** with neovim gem
- **Node.js** (for JavaScript/TypeScript LSP)
- **tmux** for terminal multiplexing integration (mood spawns a lot of tmux panels)
- **A Nerd Font** for icons (recommended: JetBrains Mono Nerd Font)
- **fd** for faster file finding

### Optional Dependencies
- **LazyGit** for Git integration

## Installation by Operating System

### Ubuntu/Debian

```bash
# Update package list
sudo apt update

# Install Neovim (latest stable)
sudo apt install neovim

# Install ripgrep
sudo apt install ripgrep

# Install Python 3 and pip
sudo apt install python3 python3-pip

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install required packages
pip3 install neovim
gem install neovim

# Install optional tools
sudo apt install fd-find tmux alacritty
```

### Arch Linux

```bash
# Install Neovim
sudo pacman -S neovim

# Install ripgrep
sudo pacman -S ripgrep

# Install Python and pip
sudo pacman -S python python-pip

# Install Node.js
sudo pacman -S nodejs npm

# Install required packages
pip install neovim
gem install neovim

# Install tools
sudo pacman -S fd tmux alacritty
```

### macOS

Using Homebrew:

```bash
# Install Neovim
brew install neovim

# Install ripgrep
brew install ripgrep

# Install Python (if not already installed)
brew install python

# Install Node.js
brew install node

# Install Ruby (if not already installed)
brew install ruby

# Install required packages
pip3 install neovim
gem install neovim

# Install optional tools
brew install fd tmux alacritty
```

## Installing NeoMood

### Method 1: Direct Installation

Replace your current Neovim configuration:

```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup

# Clone NeoMood
git clone https://github.com/yourusername/neomood.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Method 2: Test Installation

Try NeoMood without affecting your current setup:

```bash
# Clone to test directory
git clone https://github.com/yourusername/neomood.git ~/.config/neomood-test

# Start Neovim with test config
NVIM_APPNAME=neomood-test nvim
```

If you like the configuration, you can then make it permanent:

```bash
# Remove or backup current config
mv ~/.config/nvim ~/.config/nvim.backup

# Move test config to main location
mv ~/.config/neomood-test ~/.config/nvim
```

## Post-Installation Setup

### 1. Health Check

Run the health check to verify everything is working:

```vim
:checkhealth
```

This will show you any missing dependencies or configuration issues.

### 2. Install a Nerd Font

For proper icon display, install a Nerd Font:

1. Download a Nerd Font from [https://www.nerdfonts.com/](https://www.nerdfonts.com/)
2. Install it on your system
3. Configure your terminal to use the font (on the alacritty config in ~/.config/alacritty/alacritty.toml)

### 3. Language Server Setup

Some language servers may require additional setup:

```vim
" Run in Neovim to install/update language servers
:LspInstall
```

### 4. Plugin Updates

To update all plugins:

```vim
:Lazy update
```

## Troubleshooting

### Common Issues

**Plugins not loading**:
- Ensure you have internet connection
- Try `:Lazy` and then press `I` to install plugins manually

**LSP not working**:
- Run `:checkhealth lsp` to diagnose issues
- Ensure language servers are installed for your languages

**Icons not displaying**:
- Install a Nerd Font and configure your terminal
- Check `:checkhealth` for font-related issues

**Slow startup**:
- Run `:Lazy profile` to identify slow plugins
- Consider disabling unused plugins

### Getting Help

If you encounter issues:

1. Check `:checkhealth` output
2. Review the error messages carefully
3. Consult the [troubleshooting section](troubleshooting.md)
4. Open an issue with your system details and error logs

## Tmux + Alacritty Setup (Highly Recommended)

NeoMood is designed to work seamlessly with tmux and Alacritty for the optimal development experience:

### Quick Setup
```bash
# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy configurations
cp ~/.config/neomood/extra/.tmux.conf ~/.tmux.conf
cp ~/.config/neomood/extra/alacritty.toml ~/.config/alacritty/alacritty.toml

# Start tmux and install plugins
tmux
# Press Ctrl+x then I (capital i) to install plugins
```

For detailed tmux workflow setup, see the [Tmux Workflow Guide](tmux-workflow.md).

## Next Steps

After installation:

1. **Set up tmux workflow** - See [tmux workflow guide](tmux-workflow.md) for the complete development environment
2. Review the [key mappings](mappings.md)
3. Explore the [plugin documentation](plugins.md)
4. Check the [quick reference handbook](../handbook.md)
5. Start customizing your configuration!
