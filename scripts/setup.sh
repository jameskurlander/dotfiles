#!/bin/bash
DOTFILES_DIR="$HOME/Repos/dotfiles"

personal_flag=false

while getopts "p" flag; do
  case "${flag}" in
    p) personal_flag=true ;;
    *) 
       echo "Invalid option: -$OPTARG" 
       exit 1 ;;
  esac
done

echo "Setting MacOS defaults..."
sh $DOTFILES_DIR/osx/set-defaults.sh

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homebrew packages
brew tap homebrew/bundle
brew bundle --file="$DOTFILES_DIR/homebrew/Brewfile.work"

if [[ "$personal_flag" == true && -f "$DOTFILES_DIR/homebrew/Brewfile.personal" ]]; then
  echo "Installing from Brewfile.personal..."
  brew bundle --file="$DOTFILES_DIR/homebrew/Brewfile.personal"
else
  echo "Brewfile.personal not found in dotfiles directory."
fi

# Symlink for ghostty
rm -rf "$HOME/.config/ghostty"
ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
echo "Symlinked ghostty config"

# Symlink for zsh
rm -rf "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
echo "Symlinked zsh config"

# Symlink for zsh_plugins
rm -rf "$HOME/.zsh_plugins.txt"
ln -sf "$DOTFILES_DIR/zsh/zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
echo "Symlinked zsh plugins"

# Symlink for neovim
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "Symlinked neovim config"

# Symlink for tmux
rm -rf "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
echo "Symlinked tmux config"

# Symlink for spotify-player
rm -rf "$HOME/.config/spotify-player"
ln -sf "$DOTFILES_DIR/spotify-player" "$HOME/.config/spotify-player"
echo "Symlinked spotify-player config"

# Symlink for yazi
rm -rf "$HOME/.config/yazi"
ln -sf "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
echo "Symlinked yazi config"

# Symlink for newsboat
rm -rf "$HOME/.newsboat"
ln -sf "$DOTFILES_DIR/newsboat" "$HOME/.newsboat"
echo "Symlinked newsboat config"

# Refresh the terminal
reset
