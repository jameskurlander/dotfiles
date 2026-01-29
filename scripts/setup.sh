#!/bin/bash
DOTFILES_DIR="$HOME/Repos/dotfiles"
ORANGE=$(tput setaf 3)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

personal_flag=false

while getopts "p" flag; do
  case "${flag}" in
    p) personal_flag=true ;;
    *) 
       echo "Invalid option: -$OPTARG" 
       exit 1 ;;
  esac
done

# Set MacOS defaults
echo "Setting MacOS defaults..."
sh $DOTFILES_DIR/osx/set-defaults.sh

# Install & Update Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "${GREEN}Updating Homebrew...${RESET}"
  brew update
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homebrew packages
brew bundle --file="$DOTFILES_DIR/homebrew/Brewfile.work"

if [[ "$personal_flag" == true ]]; then
  if [[ -f "$DOTFILES_DIR/homebrew/Brewfile.personal" ]]; then
    echo "Installing from Brewfile.personal..."
    brew bundle --file="$DOTFILES_DIR/homebrew/Brewfile.personal"
  else
    echo "${ORANGE}WARNING: Brewfile.personal not found in dotfiles directory.${RESET}"
  fi
fi

# Update Homebrew packages
echo "${GREEN}Updating Homebrew packages...${RESET}"
brew upgrade

# Symlink for zsh
rm -rf "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
echo "${BLUE}Symlinked zsh config${RESET}"

# Symlink for zsh_plugins
rm -rf "$HOME/.zsh_plugins.txt"
ln -sf "$DOTFILES_DIR/zsh/zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
echo "${BLUE}Symlinked zsh plugins${RESET}"

# Update zsh plugins
if command -v antidote &>/dev/null; then
  echo "${GREEN}Updating zsh plugins...${RESET}"
  antidote update
else
  echo "${ORANGE}WARNING: antidote not installed. Skipping zsh plugin update.${RESET}"
fi

# Symlink for tmux
rm -rf "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
echo "${BLUE}Symlinked tmux config${RESET}"

# Update tmux plugins
if command -v tmux &>/dev/null; then
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "${ORANGE}WARNING: tpm not installed. Skipping tmux plugin update.${RESET}"
  else
    echo "${GREEN}Updating tmux plugins...${RESET}"
    if [ -z "$TMUX" ]; then
      tmux start-server
      ~/.tmux/plugins/tpm/bin/update_plugins all
      tmux kill-server
    else
      ~/.tmux/plugins/tpm/bin/update_plugins all
    fi
  fi
else
  echo "${ORANGE}WARNING: tmux not installed. Skipping tmux plugin update.${RESET}"
fi

# Symlink for opencode
rm -f "$HOME/.config/opencode/opencode.jsonc"
ln -s "$DOTFILES_DIR/opencode/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc"
echo "${BLUE}Symlinked opencode config${RESET}"

# Symlink for ghostty
rm -rf "$HOME/.config/ghostty"
ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
echo "${BLUE}Symlinked ghostty config${RESET}"

# Symlink for neovim
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "${BLUE}Symlinked neovim config${RESET}"

# Symlink for spotify-player
rm -rf "$HOME/.config/spotify-player"
ln -sf "$DOTFILES_DIR/spotify-player" "$HOME/.config/spotify-player"
echo "${BLUE}Symlinked spotify-player config${RESET}"

# Symlink for yazi
rm -rf "$HOME/.config/yazi"
ln -sf "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
echo "${BLUE}Symlinked yazi config${RESET}"

# Symlink for newsboat
rm -rf "$HOME/.newsboat"
ln -sf "$DOTFILES_DIR/newsboat" "$HOME/.newsboat"
echo "${BLUE}Symlinked newsboat config${RESET}"

# Refresh the terminal
reset
