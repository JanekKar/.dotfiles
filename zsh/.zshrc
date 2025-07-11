# Jan Karaszewski .zshrc

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to vim rc file
export MYVIMRC=$HOME/.config/nvim/init.vim

export PATH=~/.local/.npm-global/bin:$PATH

# Some highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]='fg=white'

ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'

# Errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red'

# commands like echo git npm
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'

# path
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ZSH plugins
plugins=(git docker docker-compose virtualenv zsh-autosuggestions zsh-syntax-highlighting sbt)

source $ZSH/oh-my-zsh.sh
source $HOME/.alias

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Starship prompt
eval "$(starship init zsh)"
