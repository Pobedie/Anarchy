# Install all base packages.
# Try pacman first; fall back to the AUR (yay) for any individual package
# that isn't available in the official repositories.
mapfile -t packages < <(grep -v '^#' "$anarchy_INSTALL/anarchy-base.packages" | grep -v '^$')
for pkg in "${packages[@]}"; do
  # anarchy-pkg-add skips already-installed packages; fall back to AUR on failure
  anarchy-pkg-add "$pkg" || anarchy-pkg-aur-add "$pkg"
done
