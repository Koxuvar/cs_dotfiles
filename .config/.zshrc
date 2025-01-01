export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#oh-my-zsh config options
ZSH_THEME="agnoster2"
DISABLE_LS_COLORS="true"

#plugins
plugins=(
    git
    aliases
    wd
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

# check for omz updates
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

#configs
alias zconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tconf='nvim ~/.config/tmux/tmux.conf'

#shell stuff
alias ls='ls -XC --color=auto'
alias la='ls -ACX --color=auto'
alias l='ls -lA --color=auto'
alias vim='nvim'
alias fcd='cd $(find . -type d | fzf)'
alias lg='lazygit'
#alias fzf='fzf --tmux'
#git
alias ga='git add'
alias gc='git commit -m'
alias gpush='git push'
alias gpull='git pull'

#cmds
alias grep='grep --color=auto'
alias cls='clear'


############ swaylock #############
alias swlk='swaylock -f -C $HOME/.config/swaylock/config'
############ the fuck ############ 
eval "$(thefuck --alias)"

############ yazi y Wrapper ############ 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


############ Color MGMT ############ 
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

############ Startup ############ 
neofetch 

if [[ $platform == 'windows11' ]]; then
    home
fi

eval "$(zoxide init zsh)"

if [ -f ~/.config/fzf/fzfrc ]; then
    source ~/.config/fzf/fzfrc
else
    print "404: fzf config file not found."
fi

