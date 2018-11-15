#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
PS1='\[\033[01;34m\]Arc\[\033[01;31m\]-\[\033[01;34m\]Pintade \[\033[00;31m\]\w\[\033[31m\]\$\[\033[32m\] '
#PS1='\h \W \$ '
#PS1='\e[1;3333m\]Arc-Pintade\[\033[01;31m\] \w \$\[\e[0m '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# shell open

cowsay "Gné content !!!"

# custom alias & function

alias frameWorkRoot='bash ~/.createRoot.sh'
alias openCode='bash ~/.openCode.sh'
alias lyoserv='ssh -XY acarle@lyoserv.in2p3.fr'
alias ff='firefox & exit'
alias piskel='./Downloads/Piskel-0.14.0-64bits/piskel'
alias fff='yes "fédération française de football"'
alias ffp='firefox -private & exit'
alias red='redshift & exit'
alias matrix='cmatrix -a -o -B'
alias ghost='cowsay -f ghostbusters'
alias heure='cowthink $(date)'
alias lmms='lmms & exit'
alias dual='xrandr --output LVDS1 --auto --output VGA1 --auto --right-of LVDS1'
alias over='xrandr --auto'
export VISUAL="vim"
setxkbmap fr
