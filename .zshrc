export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="koxuvar"


# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

plugins=(
    git
    aliases
    wd
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"


alias ls='ls -XC --color=auto'
alias la='ls -ACX --color=auto'
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

