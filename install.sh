#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define ANARCHY locations
export ANARCHY_PATH="$HOME/.local/share/omarchy"
export ANARCHY_INSTALL="$ANARCHY_PATH/install"
export ANARCHY_INSTALL_LOG_FILE="/var/log/omarchy-install.log"
export PATH="$ANARCHY_PATH/bin:$PATH"

# Install
source "$ANARCHY_INSTALL/helpers/all.sh"
source "$ANARCHY_INSTALL/preflight/all.sh"
source "$ANARCHY_INSTALL/packaging/all.sh"
source "$ANARCHY_INSTALL/config/all.sh"
source "$ANARCHY_INSTALL/login/all.sh"
source "$ANARCHY_INSTALL/post-install/all.sh"
