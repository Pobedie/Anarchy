ANARCHY_MIGRATIONS_STATE_PATH=~/.local/state/omarchy/migrations
mkdir -p $ANARCHY_MIGRATIONS_STATE_PATH

for file in ~/.local/share/omarchy/migrations/*.sh; do
  touch "$ANARCHY_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
