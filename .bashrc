#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


############# ALIAS #############
#list
alias ls='ls -XC --color=auto'
alias la='ls -ACX --color=auto'
alias vim='nvim'

#cmds
alias grep='grep --color=auto'
alias home='cd /mnt/c/Users/Connor/'
alias cls='clear'

#git
alias gi='git init'
alias gc='git commit -m'
alias gpush='git push'
alias gpull='git pull'

############ the fuck ############ 
eval "$(thefuck --alias)"
PS1='[\u@\h \W]\$ '

############ Color MGMT ############ 
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

############ Startup ############ 
neofetch | lolcat

home


