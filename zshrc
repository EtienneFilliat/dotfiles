#
# Spiki ZSH dotfiles
# zshrc: main file for interactive shells
#

# Load custom dotfiles
for file in "$HOME/.zsh/"*.zsh; do
  source "${file}"
done

# Prezto, a configuration framework for Zsh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)
