#!/bin/zsh

if type nvim > /dev/null; then
  export EDITOR=nvim
  alias vim=$EDITOR
fi

if type exa > /dev/null; then
  alias ls=exa
fi

if type bat > /dev/null; then
  alias cat=bat
fi

alias ez="$EDITOR ~/.dotfiles/.config/zsh/.zshrc && ~/.dotfiles/create-symlink && exec zsh"
