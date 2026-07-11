# Copy over ANARCHY configs
mkdir -p ~/.config
cp -R ~/.local/share/anarchy/config/* ~/.config/

# Use default bashrc from ANARCHY
cp ~/.local/share/anarchy/default/bashrc ~/.bashrc
