# Copy over ANARCHY configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use default bashrc from ANARCHY
cp ~/.local/share/omarchy/default/bashrc ~/.bashrc
