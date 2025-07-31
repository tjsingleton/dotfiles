# Dotfiles

A comprehensive collection of shell configuration files, aliases, and development tools for macOS.

## 🎉 Status: Production Ready

This dotfiles repository is fully configured and tested. All components are working perfectly with comprehensive error handling and testing.

## ✨ Features

### Core Configuration
- **Oh My Zsh**: Latest version with robbyrussell theme and essential plugins
- **asdf**: Version manager for Ruby (3.4.4)
- **Vim**: Configured with essential plugins (ctrlp, nerdcommenter, fugitive, repeat, surround)
- **Homesick**: Dotfiles management with automatic symlinking

### Shell Environment
- **Zsh**: Primary shell with comprehensive configuration
- **Error Handling**: Robust error detection and startup testing
- **Environment Detection**: Work vs personal environment detection
- **Cursor Optimizations**: Git pager disabled, editor set to cursor when in Cursor IDE

### Development Tools
- **Git**: Configured with aliases and optimizations
- **Ruby**: Managed via asdf with proper PATH configuration
- **VPN Management**: GlobalProtect start/stop functions
- **Kubernetes**: kubectl node describe alias
- **JWT**: Token decoding function

### Testing Framework
- **33 comprehensive tests** covering all functionality
- **Startup error detection** to catch shell initialization issues
- **Homesick conflict detection** to ensure proper symlink management
- **All tests passing** - production-ready status

## 🚀 Installation

### Prerequisites
- macOS
- Git
- Ruby (will be installed via asdf)

### Quick Start
```bash
# Clone the repository
git clone https://github.com/tjsingleton/dotfiles.git ~/.homesick/repos/dotfiles

# Install homesick if not already installed
gem install homesick

# Link all dotfiles
homesick link dotfiles

# Test the installation
cd ~/.homesick/repos/dotfiles
./test_runner.sh
```

### Manual Installation
If you prefer to install components manually:

1. **Install Oh My Zsh**:
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. **Install asdf**:
   ```bash
   brew install asdf
   ```

3. **Install Ruby**:
   ```bash
   asdf plugin add ruby
   asdf install ruby 3.4.4
   asdf global ruby 3.4.4
   ```

4. **Install Vim plugins**:
   ```bash
   vim +PluginInstall +qall
   ```

## 📁 File Structure

```
dotfiles/
├── home/                    # Configuration files
│   ├── .zshrc             # Zsh configuration
│   ├── .profile           # Shell environment setup
│   ├── .aliases           # Shell aliases and functions
│   ├── .vimrc             # Vim configuration
│   └── .oh-my-zsh/       # Oh My Zsh installation
├── test_dotfiles.sh       # Comprehensive test suite
├── test_runner.sh         # Test runner script
├── TESTING.md             # Testing documentation
├── README.md              # This file
└── TODO.md                # Development progress
```

## ⚙️ Configuration Files

### `.zshrc`
- Oh My Zsh configuration with robbyrussell theme
- Plugin configuration (git, brew, gem, macos)
- Environment variable setup
- Cursor-specific optimizations

### `.profile`
- PATH configuration
- Environment variables
- asdf initialization
- Work-specific settings (conditional loading)
- Robust error handling with `find` instead of glob expansion

### `.aliases`
- Git aliases and shortcuts
- Development tool aliases
- Work-specific functions (VPN, kubectl, JWT)
- Environment detection for work settings

### `.vimrc`
- Essential Vim plugins
- Key mappings and settings
- Plugin management via Vundle

## 🔧 Environment Variables

### Core Variables
- `ZSH_THEME`: robbyrussell
- `EDITOR`: cursor (when in Cursor IDE)
- `GIT_PAGER`: "" (disabled in Cursor)
- `PATH`: Includes asdf, local bins, work tools

### Work-Specific Variables
- `GR_HOME`: Work directory (only set in work environment)
- `AWS_DEFAULT_REGION`: us-east-1
- `DOCKER_BUILDKIT`: 1

### Debug Variables
- `DOTFILES_DEBUG`: 0 (set to 1 for verbose output)

## 🧪 Testing

### Run All Tests
```bash
./test_runner.sh
```

### Test Categories
- **File Existence**: Verify all configuration files are present
- **Oh My Zsh**: Check installation and theme/plugins
- **asdf & Ruby**: Verify version manager and Ruby installation
- **Vim**: Check configuration and plugins
- **Environment Variables**: Validate PATH and core variables
- **Git Configuration**: Test git availability and version
- **Cursor Environment**: Detect and test Cursor-specific optimizations
- **Work Environment**: Test work vs personal environment detection
- **File Permissions**: Ensure configuration files are readable
- **Startup Error Detection**: Catch shell initialization issues
- **Homesick Link Status**: Ensure proper symlink management

### Test Results
```
==========================================
        DOTFILES TEST SUITE
==========================================
Total tests: 33
Passed: 33
Failed: 0
🎉 All tests passed! Your dotfiles are working perfectly.
```

## 🔍 Troubleshooting

### Common Issues

#### "no matches found" Error
**Solution**: Fixed in latest version using `find` instead of glob expansion.

#### Oh My Zsh Not Loading
**Solution**: Ensure Oh My Zsh is installed and `.zshrc` is properly sourced.

#### asdf Not Found
**Solution**: Verify asdf is installed and initialized in `.profile`.

#### Homesick Conflicts
**Solution**: Run `homesick link dotfiles` to resolve symlink conflicts.

### Debug Mode
Enable verbose output for troubleshooting:
```bash
export DOTFILES_DEBUG=1
source ~/.zshrc
```

### Manual Testing
```bash
# Test shell configuration
zsh -c "source ~/.zshrc; echo 'Configuration loaded successfully'"

# Test Oh My Zsh
zsh -c "source ~/.zshrc; echo 'Theme: ' \$ZSH_THEME"

# Test environment variables
zsh -c "source ~/.profile; echo 'PATH: ' \$PATH"
```

## 🎨 Customization

### Adding New Aliases
Edit `home/.aliases` and add your custom aliases:
```bash
# Example custom alias
alias ll='ls -la'
```

### Adding Oh My Zsh Plugins
Edit `home/.zshrc` and add plugins to the plugins array:
```bash
plugins=(git brew gem macos docker kubectl)
```

### Creating Custom Themes
1. Create a new theme file in `home/.oh-my-zsh/themes/`
2. Set `ZSH_THEME="your-theme-name"` in `.zshrc`

### Work-Specific Configuration
Work settings are automatically detected and loaded when `GR_HOME` is set. Add work-specific configurations to the conditional blocks in `.profile` and `.aliases`.

## 🔄 Updates

### Updating Oh My Zsh
```bash
omz update
```

### Updating asdf
```bash
asdf plugin update --all
```

### Updating Dotfiles
```bash
homesick pull dotfiles
homesick link dotfiles
```

## 📚 Documentation

- **TESTING.md**: Comprehensive testing documentation
- **TODO.md**: Development progress and completed tasks
- **Oh My Zsh**: [Official Documentation](https://ohmyz.sh/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run the test suite: `./test_runner.sh`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) for the excellent shell framework
- [asdf](https://asdf-vm.com/) for version management
- [Homesick](https://github.com/technicalpickles/homesick) for dotfiles management
- [Vim](https://www.vim.org/) for the powerful text editor

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section
2. Run the test suite: `./test_runner.sh`
3. Enable debug mode: `export DOTFILES_DEBUG=1`
4. Open an issue with detailed error information

---

**Status**: ✅ Production Ready - All tests passing, comprehensive error handling, and robust configuration. 