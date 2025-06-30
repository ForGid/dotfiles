#!/bin/sh

echo "[dotfiles] Installing packages..."
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#' ~/dotfiles/packages.txt)

echo "[dotfiles] Bootstrapping configs..."

# Ensure ~/.config exists
mkdir -p ~/.config

echo "[dotfiles] Linking configs..."
ln -srf ~/dotfiles/.config/nvim ~/.config/
ln -srf ~/dotfiles/.config/hypr ~/.config/
ln -srf ~/dotfiles/.config/kitty ~/.config/
ln -srf ~/dotfiles/.config/fastfetch ~/.config/
ln -srf ~/dotfiles/.config/waybar ~/.config/
ln -srf ~/dotfiles/.zshrc ~/
ln -srf ~/dotfiles/.zprofile ~/
ln -srf ~/dotfiles/screen_saver.sh ~/
chmod +x ~/screen_saver.sh

mkdir -p ~/.local/bin
ln -srf ~/dotfiles/setwall ~/.local/bin/
chmod +x ~/.local/bin/setwall

echo "[dotfiles] Done."
