### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

##########################
# Prompt               #
##########################

zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

##########################
# Pluginsx               #
##########################

zinit for \
    light-mode \
  zsh-users/zsh-autosuggestions \
    light-mode \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word

zi ice from"gh-r" as"program"
zi light junegunn/fzf

zi ice as"command" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zi light BurntSushi/ripgrep

zi ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zi light sharkdp/fd

zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat

zi ice lucid from"gh-r" as"program" mv"bin/exa* -> exa"
zi light ogham/exa

zi ice lucid from"gh-r" as"program" mv"lazygit* -> lazygit"
zi light jesseduffield/lazygit

zi ice lucid from"gh-r" as"program" mv"zellij* -> zellij"
zi light zellij-org/zellij

zi ice lucid from"gh-r" as"program" mv"jq* -> jq"
zi light stedolan/jq

zi light rupa/z

zi load asdf-vm/asdf

##########################
# Settings               #
##########################

bindkey '^P' up-history
bindkey '^N' down-history

##########################
# Sources                #
##########################

sources=(
  'alias'
  'function'
  'tmux'
)

for s in "${sources[@]}"; do
  source $HOME/.config/zsh/include/${s}.zsh
done
