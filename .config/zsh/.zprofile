export ZDOTDIR="$HOME/.config/zsh/"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
