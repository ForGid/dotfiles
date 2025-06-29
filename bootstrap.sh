#!/bin/sh


echo "[dotfiles] Installing packages..."
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#' ~/dotfiles/packages.txt)

echo "[dotfiles] Bootstrapping configs..."

# Create config directories if missing
mkdir -p ~/.config

echo "[dotfiles] Linking configs..."
ln -srf .config/nvim ~/.config/
ln -srf .config/hypr ~/.config/
ln -srf .zshrc ~/
ln -srf .zprofile ~/
ln -srf screen_saver.sh ~/
chmod +x screen_saver.sh
mkdir -p ~/.local/bin
ln -srf setwall ~/.local/bin
chmod +x setwall

echo "[dotfiles] Done."
