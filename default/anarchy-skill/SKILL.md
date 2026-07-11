---
name: anarchy
description: >
  REQUIRED for end-user customization of Linux desktop, window manager, or system config.
  Use when editing ~/.config/hypr/, ~/.config/waybar/, ~/.config/walker/,
  ~/.config/alacritty/, ~/.config/foot/, ~/.config/kitty/, ~/.config/ghostty/, ~/.config/mako/,
  or ~/.config/anarchy/. Triggers: Hyprland, window rules, animations, keybindings,
  monitors, gaps, borders, blur, opacity, waybar, walker, terminal config, themes,
  background, night light, idle, lock screen, screenshots, reminders, layer rules,
  workspace settings, display config, and user-facing anarchy commands. Excludes ANARCHY
  source development in ~/.local/share/anarchy/ and `anarchy dev` workflows.
---

# ANARCHY Skill

Manage [ANARCHY](https://anarchy.org/) Linux systems - a beautiful, modern, opinionated Arch Linux distribution with Hyprland.

This skill is for end-user customization on installed systems.
It is not for contributing to ANARCHY source code.

## When This Skill MUST Be Used

**ALWAYS invoke this skill for end-user requests involving ANY of these:**

- Editing ANY file in `~/.config/hypr/` (window rules, animations, keybindings, monitors, etc.)
- Editing ANY file in `~/.config/waybar/`, `~/.config/walker/`, `~/.config/mako/`
- Editing terminal configs (alacritty, foot, kitty, ghostty)
- Editing ANY file in `~/.config/anarchy/`
- Window behavior, animations, opacity, blur, gaps, borders
- Layer rules, workspace settings, display/monitor configuration
- Themes, backgrounds, fonts, appearance changes
- User-facing `anarchy` commands (`anarchy theme ...`, `anarchy refresh ...`, `anarchy restart ...`, etc.)
- Screenshots, screen recording, reminders, night light, idle behavior, lock screen

**If you're about to edit a config file in ~/.config/ on this system, STOP and use this skill first.**

**Do NOT use this skill for ANARCHY development tasks** (editing files in `~/.local/share/anarchy/`, creating migrations, or running `anarchy dev ...` workflows).

## Critical Safety Rules

**For end-user customization tasks, NEVER modify anything in `~/.local/share/anarchy/`** - but READING is safe and encouraged.

This directory contains ANARCHY's source files managed by git. Any changes will be:
- Lost on next `anarchy update`
- Cause conflicts with upstream
- Break the system's update mechanism

```
~/.local/share/anarchy/     # READ-ONLY - NEVER EDIT (reading is OK)
├── bin/                    # Source scripts (symlinked to PATH)
├── config/                 # Default config templates
├── themes/                 # Stock themes
├── default/                # System defaults
├── migrations/             # Update migrations
└── install/                # Installation scripts
```

**Reading `~/.local/share/anarchy/` is SAFE and useful** - do it freely to:
- Understand how anarchy commands work: `anarchy theme set --help` or `cat $(which anarchy-theme-set)`
- See default configs before customizing: `cat ~/.local/share/anarchy/config/waybar/config.jsonc`
- Check stock theme files to copy for customization
- Reference default hyprland settings: `cat ~/.local/share/anarchy/default/hypr/*`

**Always use these safe locations instead:**
- `~/.config/` - User configuration (safe to edit)
- `~/.config/anarchy/themes/<custom-name>/` - Custom themes (must be real directories)
- `~/.config/anarchy/hooks/` - Custom automation hooks

If the request is to develop ANARCHY itself, this skill is out of scope. Follow repository development instructions instead of this skill.

## System Architecture

ANARCHY is built on:

| Component | Purpose | Config Location |
|-----------|---------|-----------------|
| **Arch Linux** | Base OS | `/etc/`, `~/.config/` |
| **Hyprland** | Wayland compositor/WM | `~/.config/hypr/` |
| **Waybar** | Status bar | `~/.config/waybar/` |
| **Walker** | App launcher | `~/.config/walker/` |
| **Alacritty/Foot/Kitty/Ghostty** | Terminals | `~/.config/<terminal>/` |
| **Mako** | Notifications | `~/.config/mako/` |
| **SwayOSD** | On-screen display | `~/.config/swayosd/` |

## Command Discovery

ANARCHY ships a single `anarchy` CLI that dispatches to all `anarchy-*` binaries via `anarchy <group> <action>`. Always prefer this form — it is self-documenting and stable. The underlying `anarchy-*` binaries still exist on `PATH` and remain safe to read for source.

```bash
# List every documented command and its summary
anarchy commands

# Show the commands inside a group
anarchy theme --help
anarchy refresh --help
anarchy restart --help

# Show help for a specific command (does not execute it)
anarchy theme set --help

# Machine-readable listing (binary, route, summary, args, aliases)
anarchy commands --json

# Read a command's source to understand it
cat $(which anarchy-theme-set)
```

### Command Groups

Run `anarchy --help` for the full list. The most common groups:

| Group | Purpose | Example |
|-------|---------|---------|
| `anarchy refresh` | Reset config to defaults (backs up first) | `anarchy refresh waybar` |
| `anarchy restart` | Restart a service/app | `anarchy restart waybar` |
| `anarchy toggle` | Toggle feature on/off | `anarchy toggle nightlight` |
| `anarchy theme` | Theme management | `anarchy theme set <name>` |
| `anarchy install` | Install optional software / packages | `anarchy install docker dbs` |
| `anarchy launch` | Launch apps | `anarchy launch browser` |
| `anarchy capture` | Screenshots and recordings | `anarchy capture screenshot` |
| `anarchy reminder` | Desktop notification reminders | `anarchy reminder 15 "Pickup Jack"` |
| `anarchy pkg` | Package management | `anarchy pkg install <pkg>` |
| `anarchy setup` | Initial setup tasks | `anarchy setup fingerprint` |
| `anarchy update` | System updates | `anarchy update` |

## Configuration Locations

### Hyprland (Window Manager)

```
~/.config/hypr/
├── hyprland.conf      # Main config (sources others)
├── bindings.conf      # Keybindings
├── monitors.conf      # Display configuration
├── input.conf         # Keyboard/mouse settings
├── looknfeel.conf     # Appearance (gaps, borders, animations)
├── envs.conf          # Environment variables
├── autostart.conf     # Startup applications
├── hypridle.conf      # Idle behavior (screen off, lock, suspend)
├── hyprlock.conf      # Lock screen appearance
└── hyprsunset.conf    # Night light / blue light filter
```

**Key behaviors:**
- Hyprland auto-reloads on config save (no restart needed for most changes)
- Use `hyprctl reload` to force reload
- After ANY Hyprland config change, validate with `hyprctl reload` followed by `hyprctl configerrors`
- If `hyprctl configerrors` reports errors, address them and rerun validation until clean or until a real blocker is identified
- Use `anarchy refresh hyprland` to reset to defaults

### Waybar (Status Bar)

```
~/.config/waybar/
├── config.jsonc       # Bar layout and modules (JSONC format)
└── style.css          # Styling
```

**Waybar does NOT auto-reload.** You MUST run `anarchy restart waybar` after any config changes.

**Commands:** `anarchy restart waybar`, `anarchy refresh waybar`, `anarchy toggle waybar`

### Terminals

```
~/.config/alacritty/alacritty.toml
~/.config/foot/foot.ini
~/.config/kitty/kitty.conf
~/.config/ghostty/config
```

**Command:** `anarchy restart terminal`

### Other Configs

| App | Location |
|-----|----------|
| btop | `~/.config/btop/btop.conf` |
| fastfetch | `~/.config/fastfetch/config.jsonc` |
| lazygit | `~/.config/lazygit/config.yml` |
| starship | `~/.config/starship.toml` |
| git | `~/.config/git/config` |
| walker | `~/.config/walker/config.toml` |

## Safe Customization Patterns

### Pattern 1: Edit User Config Directly

For simple changes, edit files in `~/.config/`:

```bash
# 1. Read current config
cat ~/.config/hypr/bindings.conf

# 2. Backup before changes
cp ~/.config/hypr/bindings.conf ~/.config/hypr/bindings.conf.bak.$(date +%s)

# 3. Make changes with Edit tool

# 4. Apply changes
# - Hyprland: auto-reloads on save, but MUST validate with `hyprctl reload` and `hyprctl configerrors`
# - Waybar: MUST restart with `anarchy restart waybar`
# - Walker: MUST restart with `anarchy restart walker`
# - Terminals: MUST restart with `anarchy restart terminal`
```

### Pattern 2: Make a new theme

1. Create a directory under ~/.config/anarchy/themes.
2. See how an existing theme is done via ~/.local/share/anarchy/themes/catppuccin.
3. Download a matching background (or several) from the internet and put them in ~/.config/anarchy/themes/[name-of-new-theme]
4. When done with the theme, run `anarchy theme set "Name of new theme"`

### Pattern 3: Use Hooks for Automation

Create scripts in `~/.config/anarchy/hooks/` to run automatically on events:

```bash
# Available hooks (see samples in ~/.config/anarchy/hooks/):
~/.config/anarchy/hooks/
├── theme-set        # Runs after theme change (receives theme name as $1)
├── font-set         # Runs after font change
└── post-update      # Runs after `anarchy update`
```

Example hook (`~/.config/anarchy/hooks/theme-set`):
```bash
#!/bin/bash
THEME_NAME=$1
echo "Theme changed to: $THEME_NAME"
# Add custom actions here
```

### Pattern 4: Reset to Defaults -- ALWAYS SEEK USER CONFIRMATION BEFORE RUNNING

When customizations go wrong:

```bash
# Reset specific config (creates backup automatically)
anarchy refresh waybar
anarchy refresh hyprland

# The refresh command:
# 1. Backs up current config with timestamp
# 2. Copies default from ~/.local/share/anarchy/config/
# 3. Restarts the component
```

## Common Tasks

### Themes

```bash
anarchy theme list              # Show available themes
anarchy theme current           # Show current theme
anarchy theme set <name>        # Apply theme (use "Tokyo Night" not "tokyo-night")
anarchy theme bg next           # Cycle background
anarchy theme install <url>     # Install from git repo
```

### Keybindings

Edit `~/.config/hypr/bindings.conf`. Format:
```
bind = SUPER, Return, exec, xdg-terminal-exec
bind = SUPER, Q, killactive
bind = SUPER SHIFT, E, exit
```

View current bindings: `anarchy menu keybindings --print`

**IMPORTANT: When re-binding an existing key:**

1. First check existing bindings: `anarchy menu keybindings --print`
2. If the key is already bound, you MUST add an `unbind` directive BEFORE your new `bind`
3. Inform the user what the key was previously bound to

Example - rebinding SUPER+F (which is bound to fullscreen by default):
```
# Unbind existing SUPER+F (was: fullscreen)
unbind = SUPER, F
# New binding for file manager
bind = SUPER, F, exec, nautilus
```

Always tell the user: "Note: SUPER+F was previously bound to fullscreen. I've added an unbind directive to override it."

### Display/Monitors

Edit `~/.config/hypr/monitors.conf`. Format:
```
monitor = eDP-1, 1920x1080@60, 0x0, 1
monitor = HDMI-A-1, 2560x1440@144, 1920x0, 1
```

List monitors: `hyprctl monitors`

### Window Rules

**CRITICAL: Hyprland window rules syntax changes frequently between versions.**

Before writing ANY window rules, you MUST fetch the current documentation from the official Hyprland wiki:
- https://github.com/hyprwm/hyprland-wiki/blob/main/content/Configuring/Window-Rules.md

DO NOT rely on cached or memorized window rule syntax. The format has changed multiple times and using outdated syntax will cause errors or unexpected behavior.

Window rules go in `~/.config/hypr/hyprland.conf` or a sourced file. Always verify the current syntax from the wiki first.

### Fonts

```bash
anarchy font list               # Available fonts
anarchy font current            # Current font
anarchy font set <name>         # Change font
```

### System

```bash
anarchy update                  # Full system update
anarchy version                 # Show ANARCHY version
anarchy debug --no-sudo --print # Debug info (ALWAYS use these flags)
anarchy system lock             # Lock screen
anarchy system shutdown         # Shutdown
anarchy system reboot           # Reboot
```

**IMPORTANT:** Always run `anarchy debug` with `--no-sudo --print` flags to avoid interactive sudo prompts that will hang the terminal.

## Troubleshooting

```bash
# Get debug information (ALWAYS use these flags to avoid interactive prompts)
anarchy debug --no-sudo --print

# Upload logs for support
anarchy upload log

# Reset specific config to defaults
anarchy refresh <app>

# Refresh specific config file
# config-file path is relative to ~/.config/
# eg. `anarchy refresh config hypr/hyprlock.conf` will refresh ~/.config/hypr/hyprlock.conf
anarchy refresh config <config-file>

# Full reinstall of configs (nuclear option)
anarchy reinstall
```

## Decision Framework

When user requests system changes:

1. **Is it a stock anarchy command?** Use it directly
2. **Is it a config edit?** Edit in `~/.config/`, never `~/.local/share/anarchy/`
3. **Is it a theme customization?** Create a NEW custom theme directory
4. **Is it automation?** Use hooks in `~/.config/anarchy/hooks/`
5. **Is it a package install?** Use `anarchy pkg add <pkgs...>` (or `anarchy pkg aur add <pkgs...>` for AUR-only packages)
6. **Unsure if command exists?** Run `anarchy commands` (or `anarchy <group> --help` for one group)

### Reminder Requests

When the user asks to set a reminder, use `anarchy reminder <minutes> [message]` directly. Convert natural language durations to minutes and title-case short reminder labels when appropriate.

```bash
anarchy reminder 15 "Pickup Jack"
anarchy reminder 60 "Check laundry"
anarchy reminder show
anarchy reminder clear
```

## Out of Scope

This skill intentionally does not cover ANARCHY source development. Do not use this skill for:
- Editing files in `~/.local/share/anarchy/` (`bin/`, `config/`, `default/`, `themes/`, `migrations/`, etc.)
- Creating or editing migrations
- Running `anarchy dev ...` commands

## Example Requests

- "Change my theme to catppuccin" -> `anarchy theme set catppuccin`
- "Add a keybinding for Super+E to open file manager" -> Check existing bindings first, add `unbind` if needed, then add `bind` in `~/.config/hypr/bindings.conf`
- "Configure my external monitor" -> Edit `~/.config/hypr/monitors.conf`
- "Make the window gaps smaller" -> Edit `~/.config/hypr/looknfeel.conf`
- "Set up night light to turn on at sunset" -> `anarchy toggle nightlight` or edit `~/.config/hypr/hyprsunset.conf`
- "Set a reminder to pickup jack in 15 minutes" -> `anarchy reminder 15 "Pickup Jack"`
- "Show my reminders" -> `anarchy reminder show`
- "Clear all reminders" -> `anarchy reminder clear`
- "Customize the catppuccin theme colors" -> Create `~/.config/anarchy/themes/catppuccin-custom/` by copying from stock, then edit
- "Run a script every time I change themes" -> Create `~/.config/anarchy/hooks/theme-set`
- "Reset waybar to defaults" -> `anarchy refresh waybar`
