#
# Spiki ZSH dotfiles
# env: export common global environment variables
#

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='nano'
export VISUAL='code'
export PAGER='less -X'
export MANPAGER="$PAGER"
export TERM=xterm-256color

export USER='spiki'

export CASE_SENSITIVE='true'
export CLICOLOR=1

export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME=gtk2

export TZ='Europe/Paris'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export WATCH='all'

export ANSIBLE_STDOUT_CALLBACK=yaml

