export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
export GVM_DIR="$HOME/.gvm"

autoload -U compinit
compinit -d ~/.config/zsh

setopt COMPLETE_IN_WORD
setopt NOBGNICE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

ZSH_THEME="avit"
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

function tunnels {
    ssh -Xi ~/.ssh/andrea.parodi andrea.parodi@130.251.104.213 -vN -L 2200:localhost:22 -L 2201:dumbo:22 -L 2202:timoteo:22 -L 2203:jimcorvo:22
}

export remote=andrea.parodi@localhost
alias drihm='ssh -p 2200 $remote'
alias dumbo='ssh -p 2201 $remote'
alias timoteo='ssh -p 2202 $remote'
alias jimcorvo='ssh -p 2203 $remote'
alias cp-drihm='scp -P 2200'
alias cp-dumbo='scp -P 2201'
alias cp-timoteo='scp -P 2202'
alias cp-jimcorvo='scp -P 2203'

[[ -s "$GVM_DIR/scripts/gvm" ]] && source "$GVM_DIR/scripts/gvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" 
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"  

export EDITOR='micro'



[[ -s "/home/parroit/.gvm/scripts/gvm" ]] && source "/home/parroit/.gvm/scripts/gvm"
