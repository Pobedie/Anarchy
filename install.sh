#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define ANARCHY locations
export ANARCHY_REPO="$HOME/.local/share/anarchy"
export ANARCHY_PATH=$HOME/.local/share/anarchy
export ANARCHY_INSTALL="$ANARCHY_REPO/install"
export ANARCHY_INSTALL_LOG_FILE="/var/log/anarchy-install.log"
export PATH="$ANARCHY_REPO/bin:$PATH"

# Install
source "$ANARCHY_INSTALL/helpers/all.sh"
source "$ANARCHY_INSTALL/preflight/all.sh"
source "$ANARCHY_INSTALL/packaging/all.sh"
source "$ANARCHY_INSTALL/config/all.sh"
source "$ANARCHY_INSTALL/login/all.sh"
source "$ANARCHY_INSTALL/post-install/all.sh"
