export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
export GVM_DIR="$HOME/.gvm"

autoload -U compinit
compinit

setopt COMPLETE_IN_WORD
setopt NOBGNICE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias gs="git status"
alias gc="git commit -am"
alias gp="git push"
alias ga="git add"
alias gk="git checkout"
alias gb="git branch"
alias ls='ls -lAh --color=auto'

alias nr='npm run --silent'
alias nb='npm run build --silent'
alias nt='npm test'
alias ns='npm start'
alias ni='npm install -S'
alias nid='npm install -D'

[[ -s "$GVM_DIR/scripts/gvm" ]] && source "$GVM_DIR/scripts/gvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR='micro'

