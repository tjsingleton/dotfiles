#!/bin/bash

# Simple test runner for dotfiles
# Usage: ./test_runner.sh [test_name]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_SCRIPT="$SCRIPT_DIR/test_dotfiles.sh"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🧪 Dotfiles Test Runner${NC}"
echo "=========================="
echo

if [ ! -f "$TEST_SCRIPT" ]; then
    echo "❌ Test script not found: $TEST_SCRIPT"
    exit 1
fi

if [ ! -x "$TEST_SCRIPT" ]; then
    echo "❌ Test script is not executable. Making it executable..."
    chmod +x "$TEST_SCRIPT"
fi

echo "Running dotfiles test suite..."
echo

# Run the test suite
"$TEST_SCRIPT"

# Exit with the same code as the test script
exit $? 