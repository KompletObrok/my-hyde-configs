#!/bin/bash
# restore.sh - Restore all HyDE configs by Meda

set -e

BACKUP_DIR="$HOME/my-hyde-configs"
CONFIG_DIR="$HOME/.config"
LOCAL_SHARE="$HOME/.local/share"

echo "Restoring Meda HyDE configuration..."

# Core HyDE configs
cp -r "$BACKUP_DIR/hypr" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/waybar" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/kitty" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/rofi" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/dunst" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/wlogout" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/hyde" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/fastfetch" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/btop" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/starship" "$CONFIG_DIR/"

# Theming
cp -r "$BACKUP_DIR/Kvantum" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/qt5ct" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/qt6ct" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/gtk-3.0" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/xsettingsd" "$CONFIG_DIR/"
cp "$BACKUP_DIR/kdeglobals" "$CONFIG_DIR/"
cp "$BACKUP_DIR/mimeapps.list" "$CONFIG_DIR/"

# Themes & Icons
mkdir -p "$HOME/.themes" "$HOME/.icons"
cp -r "$BACKUP_DIR/themes"/* "$HOME/.themes/" 2>/dev/null || true
cp -r "$BACKUP_DIR/icons"/* "$HOME/.icons/" 2>/dev/null || true
mkdir -p "$LOCAL_SHARE/themes" "$LOCAL_SHARE/icons"
cp -r "$BACKUP_DIR/local-themes"/* "$LOCAL_SHARE/themes/" 2>/dev/null || true
cp -r "$BACKUP_DIR/local-icons"/* "$LOCAL_SHARE/icons/" 2>/dev/null || true

# Fonts
mkdir -p "$LOCAL_SHARE/fonts"
cp -r "$BACKUP_DIR/fonts"/* "$LOCAL_SHARE/fonts/"
fc-cache -f

# Shell configs
cp "$BACKUP_DIR/zshrc" "$HOME/.zshrc"
cp "$BACKUP_DIR/p10k.zsh" "$HOME/.p10k.zsh"
cp "$BACKUP_DIR/bashrc" "$HOME/.bashrc"
cp "$BACKUP_DIR/bash_profile" "$HOME/.bash_profile" 2>/dev/null || true
cp -r "$BACKUP_DIR/zsh" "$CONFIG_DIR/"

# Other apps
cp -r "$BACKUP_DIR/discord" "$CONFIG_DIR/" 2>/dev/null || true
cp -r "$BACKUP_DIR/micro" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/vim" "$CONFIG_DIR/"
cp -r "$BACKUP_DIR/OpenRGB" "$CONFIG_DIR/" 2>/dev/null || true
cp -r "$BACKUP_DIR/ckb-next" "$CONFIG_DIR/" 2>/dev/null || true
cp -r "$BACKUP_DIR/coolercontrol" "$CONFIG_DIR/org.coolercontrol.CoolerControl" 2>/dev/null || true
cp -r "$BACKUP_DIR/Code-OSS" "$CONFIG_DIR/Code - OSS" 2>/dev/null || true
cp "$BACKUP_DIR/code-flags.conf" "$CONFIG_DIR/" 2>/dev/null || true

# Misc configs
cp "$BACKUP_DIR/dolphinrc" "$CONFIG_DIR/" 2>/dev/null || true
cp "$BACKUP_DIR/pavucontrol.ini" "$CONFIG_DIR/" 2>/dev/null || true
cp "$BACKUP_DIR/user-dirs.dirs" "$CONFIG_DIR/"

echo "Done. Log out and log back in, or run: hyprctl reload"
