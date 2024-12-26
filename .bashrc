#
# ~/.bashrc
#
bind -s 'set completion-ignore-case on'
bind "set show-all-if-ambiguous On"

#### Custom Aliases #####################
alias ebrc="nano ~/.bashrc"
alias snano="sudo nano"
alias vi="nvim"
alias reflectorup="sudo reflector --verbose --latest 50 --threads 2 --connection-timeout 1 --download-timeout 2 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias cat="bat"
alias prr="paru -Rns"
alias cp='rsync -r -v --progress'
alias onyx='ssh onyx'
alias neo='neo -a --charset=braille'
alias src='source ~/.bashrc'
alias pacman='sudo pacman'
alias sctl='sudo systemctl'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
#### Custom Functions #################

function cd {
	builtin cd $1 && ls -aFh --color=always
}

#########################################

# ---------------------------------------
# Set Default Editor to nano
# ---------------------------------------
EDITOR=nano
# ---------------------------------------

#### Copied from ChrisTitus #############
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias's to modified commands
# alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'

alias less='less -R'
alias cls='clear'
alias multitail='multitail --no-repeat -c'
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla='ls -Al'                # List and Hidden Files
alias las='ls -A'                 # Hidden Files
alias lls='ls -l'                 # List
# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Show open ports
alias openports='netstat -nape --inet'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# -----------------------------------------------------
# extract:  Extract most know archives with one command
# -----------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2) bunzip2 $1     ;;
        *.rar) unrar e $1     ;;
        *.gz)        gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1     ;;
        *.tgz) tar xzf $1     ;;
        *.zip) unzip $1 ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1   ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}



# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"


# ----------------------------------------------------
# cheat: cheatsheet for example commands
# ----------------------------------------------------
function cheat() {
  curl cheat.sh/$1
}

#########################################

# If not running interactively, don't do anything
# └─alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

source /usr/share/doc/pkgfile/command-not-found.bash

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s main
# fi

# eval "$(oh-my-posh init bash --config /home/scott/Downloads/git/oh-my-posh/themes/kali.omp.json)"

eval "$(thefuck --alias)"
fastfetch
source /home/scott/.bash-preexec.sh
# ---------------------------------------------------------------------------------------------------------------------
# custom bash prompt based on kali theme used in ohmyposh -- workaround because posh+atuin bug
	PS1="\e[32m┌──\e[32m(\e[38;5;69m\u@\H\e[32m)\e[32m-\e[38;5;69m[\e[32m\w\e[38;5;69m]\n\e[32m└─\$\[\e[00m\]  "
# ---------------------------------------------------------------------------------------------------------------------
eval "$(atuin init bash)"
ls

# Created by `pipx` on 2024-12-22 19:50:08
export PATH="$PATH:/home/scott/.local/bin"

tldr --quiet $(tldr --quiet --list | shuf -n1) | bat -P --style="numbers,grid,header" --file-name "TLDR" --theme TwoDark
# bat -pP --theme TwoDark ~/.tldr_intro

alias tb="nc termbin.com 9999"
