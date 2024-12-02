export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#oh-my-zsh config options
ZSH_THEME="agnoster2"
DISABLE_LS_COLORS="true"

plugins=(
    git
    aliases
    wd
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# User configuration
if [[ $( uname -a | grep -i Microsoft ) ]]; then
    alias home='cd /mnt/c/Users/Connor/'
    platform='windows11'
elif [[ $( uname -a | grep -i darwin ) ]]; then
    platform='macos'
fi

export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tconf='nvim ~/.config/tmux/tmux.conf'

alias ls='ls -XC --color=auto'
alias la='ls -ACX --color=auto'
alias l='ls -lA --color=auto'
alias vim='nvim'


#cmds
alias grep='grep --color=auto'
alias cls='clear'

#git
alias gi='git init'
alias gc='git commit -m'
alias glone='git clone'
alias gpush='git push'
alias gpull='git pull'

############ swaylock #############
alias swlk='swaylock -f -C $HOME/.config/swaylock/config'
############ the fuck ############ 
eval "$(thefuck --alias)"

############ Color MGMT ############ 
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

############ Startup ############ 
neofetch 

if [[ $platorm == 'windows11' ]]; then
    home
fi
