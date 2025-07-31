# Dotfiles Testing Framework

This directory contains a comprehensive testing framework for your dotfiles setup.

## Quick Start

### Run All Tests
```bash
# From the dotfiles directory
./test_runner.sh

# Or using the alias (from anywhere)
test-dotfiles
test-dots
```

### Run Tests Directly
```bash
# Run the main test suite
./test_dotfiles.sh
```

## What Gets Tested

The test suite verifies all major components of your dotfiles:

### 1. File Existence
- ✅ Home directory exists
- ✅ Zsh configuration exists
- ✅ Profile configuration exists
- ✅ Aliases file exists
- ✅ Vim configuration exists

### 2. Oh My Zsh Installation
- ✅ Oh My Zsh directory exists
- ✅ Zsh is available
- ✅ Zsh version check

### 3. asdf Installation
- ✅ asdf is available
- ✅ asdf version check

### 4. Ruby Installation
- ✅ Ruby is installed via asdf
- ✅ Ruby is available
- ✅ Ruby version check

### 5. Vim Configuration
- ✅ Vim directory exists
- ✅ Vim is available
- ✅ Vim version check

### 6. Environment Variables
- ✅ PATH is set
- ✅ HOME is set
- ✅ SHELL is set

### 7. Shell Configuration
- ✅ Zsh configuration loads without errors

### 8. Git Configuration
- ✅ Git is available
- ✅ Git version check

### 9. Cursor Environment
- ✅ Cursor environment detection
- ✅ Git pager is disabled in Cursor

### 10. Aliases
- ✅ Aliases file loads without errors

### 11. Work Environment
- ✅ Work environment detection

### 12. Debug Logging
- ✅ Debug logging works

## Test Output

The test suite provides colored output:
- 🟢 **Green**: Test passed
- 🔴 **Red**: Test failed
- 🟡 **Yellow**: Warning (non-critical)
- 🔵 **Blue**: Information

## Example Output

```
==========================================
        DOTFILES TEST SUITE
==========================================

[INFO] Testing file existence...
[PASS] Home directory exists
[PASS] Zsh configuration exists
[PASS] Profile configuration exists
[PASS] Aliases file exists
[PASS] Vim configuration exists

[INFO] Testing Oh My Zsh installation...
[PASS] Oh My Zsh directory exists
[PASS] Zsh is available
[PASS] Zsh version check

...

==========================================
              TEST SUMMARY
==========================================
Total tests: 25
Passed: 25
Failed: 0

🎉 All tests passed! Your dotfiles are working perfectly.
```

## Troubleshooting

### Common Issues

1. **"Permission denied" errors**
   ```bash
   chmod +x test_dotfiles.sh test_runner.sh
   ```

2. **Tests failing for missing tools**
   - Install missing tools (asdf, ruby, vim, etc.)
   - Some tests are optional and will be skipped

3. **Zsh configuration errors**
   - Check for syntax errors in `.zshrc`
   - Verify all sourced files exist

### Debug Mode

Run tests with debug output:
```bash
DOTFILES_DEBUG=1 ./test_dotfiles.sh
```

## Adding New Tests

To add a new test, edit `test_dotfiles.sh` and add:

```bash
# Test: Description
run_test "Test name" "test_command"
```

## Continuous Integration

You can run these tests:
- After installing dotfiles on a new machine
- After making changes to configuration files
- As part of a CI/CD pipeline
- Before committing changes

## Test Scripts

- `test_dotfiles.sh` - Main test suite
- `test_runner.sh` - Simple wrapper script
- `TESTING.md` - This documentation

## Aliases Added

- `test-dotfiles` - Run the test suite
- `test-dots` - Short alias for test-dotfiles 