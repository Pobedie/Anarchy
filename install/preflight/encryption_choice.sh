#!/usr/bin/env bash

# anarchy:summary=Choose between encrypted or plain disk installation.
# anarchy:requires-sudo=false

CHOICE=$(gum choose "Encrypted" "Plain")

if [[ -n "$CHOICE" ]]; then
  echo "$CHOICE" > /tmp/anarchy_encryption_mode
else
  # Default to Plain if no choice is made (e.g., user cancels)
  echo "Plain" > /tmp/anarchy_encryption_mode
fi

echo "Installation mode set to: $(cat /tmp/anarchy_encryption_mode)"
