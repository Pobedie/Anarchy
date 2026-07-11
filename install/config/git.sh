# Set identification from install inputs
if [[ -n ${ANARCHY_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$ANARCHY_USER_NAME"
fi

if [[ -n ${ANARCHY_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$ANARCHY_USER_EMAIL"
fi
