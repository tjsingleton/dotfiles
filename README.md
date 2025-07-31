# Dotfiles

Personal dotfiles configuration for macOS with Zsh, Oh My Zsh, and various development tools.

## Features

### Shell Configuration
- **Zsh** with **Oh My Zsh** framework
- **Robby Russell** theme (clean and minimal)
- **Plugins**: `git`, `brew`, `gem`, `macos`
- **Error handling** with debug logging
- **Cursor IDE integration** (Git pager disabled, editor set to `cursor`)

### Development Tools
- **asdf** version manager for Ruby
- **Homebrew** package manager aliases
- **Git** aliases and functions
- **Ruby gem** management aliases
- **macOS-specific** aliases and functions

### Environment Setup
- **PATH** configuration for common development tools
- **Timezone** set to America/New_York
- **Locale** set to en_US.UTF-8
- **AWS** default region configuration
- **Docker** BuildKit enabled

### Work-Specific Features
- **GR_HOME** environment for work projects
- **Jira** and **Tracker** environment setup
- **Custom aliases** for work directories

## Installation

### Prerequisites
- macOS
- Zsh shell
- Git
- [homesick](https://github.com/technicalpickles/homesick) gem

### Quick Install
```bash
# Install homesick if not already installed
gem install homesick

# Clone and link dotfiles
homesick clone tjsingleton/dotfiles
homesick link dotfiles

# Install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Restart your shell or source the configuration
source ~/.zshrc
```

### Manual Installation
If you prefer to install manually:

1. Clone this repository
2. Copy files to your home directory:
   ```bash
   cp home/.zshrc ~/.zshrc
   cp home/.profile ~/.profile
   cp home/.aliases ~/.aliases
   ```
3. Install Oh My Zsh
4. Restart your shell

## Configuration Files

### `.zshrc`
- Main Zsh configuration
- Oh My Zsh setup with plugins
- Theme configuration
- Sources `.profile` for additional settings

### `.profile`
- Environment variables and PATH setup
- Tool-specific configurations (asdf, dvm, etc.)
- Work-specific settings (when GR_HOME is set)
- Cursor IDE optimizations
- Error handling and debug logging

### `.aliases`
- Custom aliases and functions
- Work-specific aliases (conditional on GR_HOME)
- Testing framework aliases

## Plugins

### Git Plugin
Provides extensive Git aliases and functions:
- `g` = `git`
- `ga` = `git add`
- `gc` = `git commit`
- `gp` = `git push`
- And many more...

### Brew Plugin
Homebrew package manager aliases:
- `bi` = `brew install`
- `bu` = `brew update`
- `bup` = `brew upgrade`
- `bl` = `brew list`
- And many more...

### Gem Plugin
Ruby gem management aliases:
- `gi` = `gem install`
- `gu` = `gem update`
- `gl` = `gem list`
- And more...

### macOS Plugin
macOS-specific aliases and functions:
- `showfiles` = show hidden files
- `hidefiles` = hide hidden files
- `cleanup` = remove .DS_Store files
- And more...

## Testing

Run the test suite to verify your installation:

```bash
# Run all tests
./test_runner.sh

# Or run tests directly
./test_dotfiles.sh
```

See [TESTING.md](TESTING.md) for detailed testing documentation.

## Troubleshooting

### Shell Exits on Command Failure
If your shell exits when commands fail, check that `set -e` is not enabled in your `.profile`. The current configuration uses `set -o pipefail` which is safer for interactive shells.

### Oh My Zsh Issues
If you encounter Oh My Zsh errors:
1. Update Oh My Zsh: `omz update`
2. Clear Zsh cache: `rm -f ~/.zsh_history`
3. Restart your terminal

### Homesick Issues
If symlinks aren't working:
```bash
homesick link dotfiles
```

### Plugin Not Found
If a plugin is not found, check the plugin name. Some plugins have been renamed:
- `osx` → `macos`

## Customization

### Adding New Aliases
Add custom aliases to `home/.aliases`:

```bash
# Example custom alias
alias myproject="cd ~/projects/myproject"
```

### Adding New Plugins
Edit `home/.zshrc` and add to the plugins array:

```bash
plugins=(git brew gem macos your_new_plugin)
```

### Work-Specific Configuration
Set the `GR_HOME` environment variable to enable work-specific features:

```bash
export GR_HOME="/path/to/work/projects"
```

## Environment Variables

Key environment variables set by these dotfiles:

- `ZSH` - Oh My Zsh installation path
- `ZSH_THEME` - Theme name (robbyrussell)
- `DOTFILES_DEBUG` - Debug logging (0/1)
- `CURSOR_SESSION_ID` - Detected automatically for Cursor IDE
- `GR_HOME` - Work projects directory (optional)
- `AWS_DEFAULT_REGION` - AWS region (us-east-1)
- `TZ` - Timezone (America/New_York)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run the test suite
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) for the excellent Zsh framework
- [homesick](https://github.com/technicalpickles/homesick) for dotfiles management
- [asdf](https://asdf-vm.com/) for version management 