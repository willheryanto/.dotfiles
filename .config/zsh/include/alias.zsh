#!/bin/zsh

if type nvim > /dev/null; then
  export EDITOR=nvim
  alias vim=$EDITOR
  alias en="cd $XDG_CONFIG_HOME/nvim && $EDITOR init.lua"
fi

if type exa > /dev/null; then
  alias ls=exa
fi

if type bat > /dev/null; then
  alias cat=bat
fi

if type lazygit > /dev/null; then
  alias lg=lazygit
fi

if type nnn > /dev/null; then
  alias n=nnn

  function nnn() {
    command nnn -e "$@"
  }
fi

alias ez="cd $XDG_CONFIG_HOME/zsh/ && $EDITOR .zshrc"
