# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autoload `zinit` if not available
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz compinit
compinit
zinit cdreplay -q

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light romkatv/powerlevel10k

# History config
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no

# Fzf preview
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'ls --color $realpath'

eval $(fzf --zsh)

# Load scripts on startup
source ~/.config/zsh/paths.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/startup_io.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
