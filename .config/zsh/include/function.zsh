#!/bin/zsh

fo() {
  local files
  files=$(fd --type f --hidden --follow --exclude ".git"  . | fzf)
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
