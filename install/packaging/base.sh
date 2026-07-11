# Install all base packages.
# Try pacman first; fall back to the AUR (yay) for any individual package
# that isn't available in the official repositories.
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-base.packages" | grep -v '^$')
for pkg in "${packages[@]}"; do
  # omarchy-pkg-add skips already-installed packages; fall back to AUR on failure
  omarchy-pkg-add "$pkg" || omarchy-pkg-aur-add "$pkg"
done
