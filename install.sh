#!/bin/bash

DOTFILES_DIR="$(pwd)"

CONFIG_DIRS=("dunst" "gtk-3.0" "hypr" "hyprlock" "kitty" "nwg-look" "rofi" "waybar" "wofi")

link_config() {
    echo "🔗 Linking config directories to ~/.config..."
    for dir in "${CONFIG_DIRS[@]}"; do
        mkdir -p "$HOME/.config"
        ln -sf "$DOTFILES_DIR/$dir" "$HOME/.config/$dir"
        echo "✔️ Linked: $dir"
    done
}

link_home_files() {
    echo "🔗 Linking files to home directory..."

    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    echo "✔️ Linked: .zshrc"

    ln -sf "$DOTFILES_DIR/.Xresources" "$HOME/.Xresources"
    echo "✔️ Linked: .Xresources"
}

copy_wallpapers() {
    echo "🖼️ Copying wallpapers..."
    mkdir -p "$HOME/Pictures/Wallpapers"
    cp -r "$DOTFILES_DIR/wallpaper/." "$HOME/Pictures/Wallpapers/"
    echo "✔️ Wallpapers copied"
}

install_packages() {
    echo "📦 Installing required packages..."

    sudo apt update
    sudo apt install -y \
        hyprland \
        waybar \
        rofi \
        kitty \
        dunst \
        wofi \
        nwg-look \
        zsh \
        x11-xserver-utils \
        libgtk-3-dev

    echo "✔️ Packages installed (make sure all are available on your system)"
}

# Execution
echo "🚀 Starting dotfiles installation..."

link_config
link_home_files
copy_wallpapers
# install_packages

echo "✅ Dotfiles installation completed!"
