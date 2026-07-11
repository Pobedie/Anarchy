#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define ANARCHY locations
export anarchy_PATH="$HOME/.local/share/anarchy"
export anarchy_INSTALL="$anarchy_PATH/install"
export anarchy_INSTALL_LOG_FILE="/var/log/anarchy-install.log"
export PATH="$anarchy_PATH/bin:$PATH"

# Install
source "$anarchy_INSTALL/helpers/all.sh"
source "$anarchy_INSTALL/preflight/all.sh"
source "$anarchy_INSTALL/packaging/all.sh"
source "$anarchy_INSTALL/config/all.sh"
source "$anarchy_INSTALL/login/all.sh"
source "$anarchy_INSTALL/post-install/all.sh"
