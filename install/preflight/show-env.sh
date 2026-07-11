# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(ANARCHY_CHROOT_INSTALL|ANARCHY_ONLINE_INSTALL|ANARCHY_USER_NAME|ANARCHY_USER_EMAIL|USER|HOME|ANARCHY_REPO|ANARCHY_REF|ANARCHY_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
