# Overwrite parts of the anarchy-menu with user-specific submenus.
# See $ANARCHY_PATH/bin/anarchy-menu for functions that can be overwritten.
#
# WARNING: Overwritten functions will obviously not be updated when ANARCHY changes.
#
# Example of minimal system menu:
#
# show_system_menu() {
#   case $(menu "System" "  Lock\n󰐥  Shutdown") in
#   *Lock*) anarchy-system-lock ;;
#   *Shutdown*) anarchy-system-shutdown ;;
#   *) back_to show_main_menu ;;
#   esac
# }
#
# Example of overriding just the about menu action: (Using zsh instead of bash (default))
#
# show_about() {
#   exec anarchy-launch-or-focus-tui "zsh -c 'fastfetch; read -k 1'"
# }
