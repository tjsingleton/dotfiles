#!/bin/bash

# Simple Dotfiles Test Suite
# Tests basic functionality without sourcing configuration files

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((PASSED_TESTS++))
    ((TOTAL_TESTS++))
}

log_failure() {
    echo -e "${RED}[FAIL]${NC} $1"
    ((FAILED_TESTS++))
    ((TOTAL_TESTS++))
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Test function
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    if eval "$test_command" >/dev/null 2>&1; then
        log_success "$test_name"
        return 0
    else
        log_failure "$test_name"
        return 1
    fi
}

# Header
echo "=========================================="
echo "        DOTFILES TEST SUITE"
echo "=========================================="
echo

# Test 1: Check if essential files exist
log_info "Testing file existence..."

run_test "Home directory exists" "[ -d \"$HOME\" ]"
run_test "Zsh configuration exists" "[ -f \"$HOME/.zshrc\" ]"
run_test "Profile configuration exists" "[ -f \"$HOME/.profile\" ]"
run_test "Aliases file exists" "[ -f \"$HOME/.aliases\" ]"
run_test "Vim configuration exists" "[ -f \"$HOME/.vimrc\" ]"

# Test 2: Check if Oh My Zsh is installed
log_info "Testing Oh My Zsh installation..."

run_test "Oh My Zsh directory exists" "[ -d \"$HOME/.oh-my-zsh\" ]"
run_test "Zsh is available" "command -v zsh >/dev/null"
run_test "Zsh version check" "zsh --version >/dev/null"

# Test 3: Check asdf installation
log_info "Testing asdf installation..."

run_test "asdf is available" "command -v asdf >/dev/null"
run_test "asdf version check" "asdf --version >/dev/null"

# Test 4: Check Ruby installation via asdf
log_info "Testing Ruby installation..."

if command -v asdf >/dev/null; then
    run_test "Ruby is installed via asdf" "asdf list ruby | grep -q ."
    run_test "Ruby is available" "command -v ruby >/dev/null"
    run_test "Ruby version check" "ruby --version >/dev/null"
else
    log_warning "asdf not found, skipping Ruby tests"
fi

# Test 5: Check Vim plugins
log_info "Testing Vim configuration..."

run_test "Vim directory exists" "[ -d \"$HOME/.vim\" ]"
run_test "Vim is available" "command -v vim >/dev/null"
run_test "Vim version check" "vim --version >/dev/null"

# Test 6: Check environment variables
log_info "Testing environment variables..."

run_test "PATH is set" "[ -n \"$PATH\" ]"
run_test "HOME is set" "[ -n \"$HOME\" ]"
run_test "SHELL is set" "[ -n \"$SHELL\" ]"

# Test 7: Check git configuration
log_info "Testing Git configuration..."

run_test "Git is available" "command -v git >/dev/null"
run_test "Git version check" "git --version >/dev/null"

# Test 8: Check Cursor-specific optimizations
log_info "Testing Cursor environment detection..."

if [ -n "${CURSOR_SESSION_ID:-}" ]; then
    log_success "Cursor environment detected"
    run_test "Git pager is disabled in Cursor" "[ -z \"${GIT_PAGER:-}\" ]"
else
    log_info "Not running in Cursor environment (this is normal)"
fi

# Test 9: Check work environment detection
log_info "Testing work environment detection..."

if [ -f "$HOME/.ih/augment.sh" ]; then
    log_success "Work environment detected (.ih/augment.sh exists)"
else
    log_info "Personal environment (no work configuration)"
fi

# Test 10: Check file permissions
log_info "Testing file permissions..."

run_test "Zshrc is readable" "[ -r \"$HOME/.zshrc\" ]"
run_test "Profile is readable" "[ -r \"$HOME/.profile\" ]"
run_test "Aliases is readable" "[ -r \"$HOME/.aliases\" ]"

# Test 11: Check for startup errors
log_info "Testing startup error detection..."

# Test sourcing .profile without errors
profile_output=$(source ~/.profile 2>&1)
if [ $? -eq 0 ] && [ -z "$profile_output" ]; then
    log_success "Profile loads without errors"
else
    log_failure "Profile has errors: $profile_output"
fi

# Test sourcing .aliases without errors
aliases_output=$(source ~/.aliases 2>&1)
if [ $? -eq 0 ] && [ -z "$aliases_output" ]; then
    log_success "Aliases load without errors"
else
    log_failure "Aliases have errors: $aliases_output"
fi

# Test that shell doesn't exit on command failures (set -e should be disabled)
test_command="command_that_does_not_exist 2>/dev/null; echo 'shell_continues'"
test_output=$(zsh -c "$test_command" 2>&1)
if echo "$test_output" | grep -q "shell_continues"; then
    log_success "Shell continues after command failures (set -e disabled)"
else
    log_failure "Shell exits on command failures (set -e enabled)"
fi

# Test for specific error patterns
error_patterns=(
    "no matches found"
    "parameter not set"
    "command not found.*profile"
    "command not found.*zshrc"
    "syntax error"
)

for pattern in "${error_patterns[@]}"; do
    # Check .profile for errors
    if source ~/.profile 2>&1 | grep -q "$pattern"; then
        log_failure "Profile contains error pattern: $pattern"
    else
        log_success "Profile clean of error pattern: $pattern"
    fi
done

# Test homesick link status
log_info "Testing homesick link status..."

homesick_output=$(homesick link dotfiles 2>&1)
if echo "$homesick_output" | grep -q "conflict"; then
    log_failure "Homesick link reports conflicts: $homesick_output"
elif echo "$homesick_output" | grep -q "identical\|symlink"; then
    log_success "Homesick link reports no conflicts (all files properly linked)"
else
    log_failure "Unexpected homesick link output: $homesick_output"
fi

# Summary
echo
echo "=========================================="
echo "              TEST SUMMARY"
echo "=========================================="
echo "Total tests: $TOTAL_TESTS"
echo "Passed: $PASSED_TESTS"
echo "Failed: $FAILED_TESTS"

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed! Your dotfiles are working perfectly.${NC}"
    exit 0
else
    echo -e "${RED}❌ $FAILED_TESTS test(s) failed. Please check the configuration.${NC}"
    exit 1
fi 