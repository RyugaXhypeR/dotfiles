### path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/env

### variables
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

### zinit install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### powerlevel10k theme
zi ice depth"1"
zi light romkatv/powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### gitstatus - powerlevel10k
zi ice depth"1"
zi load romkatv/gitstatus

### fzf
zi ice from"gh-r" as=program
zi light junegunn/fzf

### zoxide
zi ice depth"1" as"program" atclone"./install.sh" atload"eval $(zoxide init zsh)"
zi light ajeetdsouza/zoxide

### eza
zi ice as"command" from"gh-r" pick"eza/eza"
zi light eza-community/eza

### bat
zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat

### syntax highlighting
zi ice depth"1"
zi light zsh-users/zsh-syntax-highlighting

### compinit
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### options
bindkey -e

### aliases
alias ls="eza --color=always"
alias la="eza -a"
alias ll="eza -l"
alias lt="eza -T"
alias lta="eza -aT"
alias lla="eza -al"
