if [[ $(plymouth-set-default-theme) != "anarchy" ]]; then
  sudo cp -r "$HOME/.local/share/anarchy/default/plymouth" /usr/share/plymouth/themes/anarchy/
  sudo plymouth-set-default-theme anarchy
fi
