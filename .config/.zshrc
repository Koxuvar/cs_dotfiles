export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh/agent-env
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source ~/.ssh/agent-env > /dev/null
fi
ssh-add -l > /dev/null 2>&1 || ssh-add ~/.ssh/id_ed25519

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

eval "$(fzf --zsh)"
# source ~/.fzf.zsh
  

#oh-my-zsh config options
ZSH_THEME="eastwood2"
DISABLE_LS_COLORS="true"

#plugins
plugins=(
    git
    aliases
    wd
    )

# check for omz updates
source $ZSH/oh-my-zsh.sh

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
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lp='eza --color=always --long --git --icons=always '
alias cd='z'
# alias ls='ls -XC --color=auto'
# alias la='ls -ACX --color=auto'
# alias l='ls -lA --color=auto'
alias vim='nvim'
alias fcd='cd $(find . -type d | fzf)'
alias lg='lazygit'

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


eval "$(zoxide init zsh)"


