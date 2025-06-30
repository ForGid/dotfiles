#!/bin/sh

cd ~ || exit 1

echo "[dotfiles] Updating system..."
sudo pacman -Syu --needed --noconfirm

echo "[dotfiles] Installing official packages..."
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#' ~/dotfiles/packages.txt)

# yay install
if ! command -v yay >/dev/null; then
  echo "[dotfiles] Installing yay..."
  git clone https://aur.archlinux.org/yay.git ~/yay
  cd ~/yay || exit 1
  makepkg -si --noconfirm
  cd ~ && rm -rf ~/yay
else
  echo "[dotfiles] yay already installed -- skipping"
fi

echo "[dotfiles] Installing AUR packages..."
yay -S --needed --noconfirm $(grep -vE '^\s*#' ~/dotfiles/aur.txt)

echo "[dotfiles] Bootstrapping configs..."

mkdir -p ~/.config

echo "[dotfiles] Linking configs..."
CONFIG_DIRS=(nvim hypr kitty fastfetch waybar)

for dir in "${CONFIG_DIRS[@]}"; do
  target="$HOME/.config/$dir"
  src="$HOME/dotfiles/.config/$dir"

  if [ -d "$target" ] && [ ! -L "$target" ]; then
    echo "[dotfiles] Removing real directory at $target"
    rm -rf "$target"
  fi

  ln -srf "$src" "$target"
done

ln -srf ~/dotfiles/.zshrc ~/
ln -srf ~/dotfiles/.gitconfig ~/
ln -srf ~/dotfiles/.zprofile ~/

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "[dotfiles] Cloning Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
  echo "[dotfiles] Oh My Zsh already present — skipping"
fi

mkdir -p ~/.local/bin

echo "[dotfiles] Linking custom scripts..."
ln -srf ~/dotfiles/scripts/screen_saver.sh ~/.local/bin/
chmod +x ~/.local/bin/screen_saver.sh

ln -srf ~/dotfiles/scripts/setwall ~/.local/bin/
chmod +x ~/.local/bin/setwall

echo "[dotfiles] Linking wallpapers"
mkdir -p ~/Pictures
ln -srf ~/dotfiles/wallpapers ~/Pictures/wallpapers

fastfetch
