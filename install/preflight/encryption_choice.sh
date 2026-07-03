#!/usr/bin/env bash

# omarchy:summary=Choose between encrypted or plain disk installation.
# omarchy:requires-sudo=false

CHOICE=$(gum choose "Encrypted" "Plain")

if [[ -n "$CHOICE" ]]; then
  echo "$CHOICE" > /tmp/omarchy_encryption_mode
else
  # Default to Plain if no choice is made (e.g., user cancels)
  echo "Plain" > /tmp/omarchy_encryption_mode
fi

echo "Installation mode set to: $(cat /tmp/omarchy_encryption_mode)"
