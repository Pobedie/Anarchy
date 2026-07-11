#!/usr/bin/env bash

set -euo pipefail

# Create a temporary working directory
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

cd "$tmpdir"

# Clone and build yay
git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si --noconfirm

echo "yay installed successfully!"
echo "Version: $(yay --version | head -n1)"
