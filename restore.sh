#!/bin/bash
# restore.sh - Restore HyDE/Hyprland configs only (no apps)

set -e

BACKUP_DIR="$HOME/my-hyde-configs"
CONFIG_DIR="$HOME/.config"
LOCAL_SHARE="$HOME/.local/share"

echo "Restoring HyDE/Hyprland configuration..."

# === CORE HYPRLAND/HYDE CONFIGS ===
[ -d "$BACKUP_DIR/hypr" ] && cp -r "$BACKUP_DIR/hypr" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/waybar" ] && cp -r "$BACKUP_DIR/waybar" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/kitty" ] && cp -r "$BACKUP_DIR/kitty" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/rofi" ] && cp -r "$BACKUP_DIR/rofi" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/dunst" ] && cp -r "$BACKUP_DIR/dunst" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/wlogout" ] && cp -r "$BACKUP_DIR/wlogout" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/hyde" ] && cp -r "$BACKUP_DIR/hyde" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/fastfetch" ] && cp -r "$BACKUP_DIR/fastfetch" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/starship" ] && cp -r "$BACKUP_DIR/starship" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/btop" ] && cp -r "$BACKUP_DIR/btop" "$CONFIG_DIR/"

# === THEMING (for HyDE appearance) ===
[ -d "$BACKUP_DIR/Kvantum" ] && cp -r "$BACKUP_DIR/Kvantum" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/qt5ct" ] && cp -r "$BACKUP_DIR/qt5ct" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/qt6ct" ] && cp -r "$BACKUP_DIR/qt6ct" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/gtk-3.0" ] && cp -r "$BACKUP_DIR/gtk-3.0" "$CONFIG_DIR/"
[ -d "$BACKUP_DIR/xsettingsd" ] && cp -r "$BACKUP_DIR/xsettingsd" "$CONFIG_DIR/"
[ -f "$BACKUP_DIR/kdeglobals" ] && cp "$BACKUP_DIR/kdeglobals" "$CONFIG_DIR/"
[ -f "$BACKUP_DIR/mimeapps.list" ] && cp "$BACKUP_DIR/mimeapps.list" "$CONFIG_DIR/"

# === THEMES & ICONS ===
if [ -d "$BACKUP_DIR/themes" ]; then
    mkdir -p "$HOME/.themes"
    cp -r "$BACKUP_DIR/themes"/* "$HOME/.themes/" 2>/dev/null || true
fi
if [ -d "$BACKUP_DIR/icons" ]; then
    mkdir -p "$HOME/.icons"
    cp -r "$BACKUP_DIR/icons"/* "$HOME/.icons/" 2>/dev/null || true
fi
if [ -d "$BACKUP_DIR/local-themes" ]; then
    mkdir -p "$LOCAL_SHARE/themes"
    cp -r "$BACKUP_DIR/local-themes"/* "$LOCAL_SHARE/themes/" 2>/dev/null || true
fi
if [ -d "$BACKUP_DIR/local-icons" ]; then
    mkdir -p "$LOCAL_SHARE/icons"
    cp -r "$BACKUP_DIR/local-icons"/* "$LOCAL_SHARE/icons/" 2>/dev/null || true
fi

# === FONTS ===
if [ -d "$BACKUP_DIR/fonts" ]; then
    mkdir -p "$LOCAL_SHARE/fonts"
    cp -r "$BACKUP_DIR/fonts"/* "$LOCAL_SHARE/fonts/"
    fc-cache -f
fi

# === SHELL CONFIGS (for terminal) ===
[ -f "$BACKUP_DIR/zshrc" ] && cp "$BACKUP_DIR/zshrc" "$HOME/.zshrc"
[ -f "$BACKUP_DIR/p10k.zsh" ] && cp "$BACKUP_DIR/p10k.zsh" "$HOME/.p10k.zsh"
[ -f "$BACKUP_DIR/bashrc" ] && cp "$BACKUP_DIR/bashrc" "$HOME/.bashrc"
[ -f "$BACKUP_DIR/bash_profile" ] && cp "$BACKUP_DIR/bash_profile" "$HOME/.bash_profile"
[ -d "$BACKUP_DIR/zsh" ] && cp -r "$BACKUP_DIR/zsh" "$CONFIG_DIR/"

# === MISC CONFIGS ===
[ -f "$BACKUP_DIR/user-dirs.dirs" ] && cp "$BACKUP_DIR/user-dirs.dirs" "$CONFIG_DIR/"

echo "Done. Log out and log back in, or run: hyprctl reload"
