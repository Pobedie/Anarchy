# Install all base packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-base.packages" | grep -v '^$')
if !omarchy-pkg-add "${packages[@]}"; then
  omarchy-pkg-aur-add "${packages[@]}"
fi
