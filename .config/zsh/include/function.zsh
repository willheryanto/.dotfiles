#!/bin/zsh

fo() {
  local files
  files=$(fd --type f --hidden --follow --exclude ".git"  . | fzf)
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

mkd() {
  if [[ -n $1 ]]; then
    mkdir $1 && cd $1
  fi
}
