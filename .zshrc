# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jeff/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#locale=en_UTF8

autoload -U promptinit
autoload -U colors && colors

function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' (' $branch ') '
    fi
}
 
setopt PROMPT_SUBST

#promptinit
#prompt redhat
PROMPT="%{$fg_bold[cyan]%}» %{$reset_color%}%b%{$fg[blue]%}%~%{$reset_color%}
[%n@%m]$ "
RPROMPT=""
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
export PATH=/home/jeffm/bin:$PATH
export PATH=/home/jeffm/WinHome/AppData/Local/Android/Sdk/platform-tools:$PATH
export PATH=/home/jeffm/WinHome/AppData/Local/Android/Sdk/emulator:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH='/cygdrive/c/Program Files (x86)/Yarn/bin':$PATH
export PATH='/cygdrive/c/Program Files/Java/jre1.8.0_251/bin':$PATH
export NODE_PATH='/cygdrive/c/Users/jeffm/AppData/Roaming/npm/node_modules':$NODE_PATH
export ANDROID_SDK=/home/jeffm/WinHome/AppData/Local/Android/Sdk
export ANDROID_HOME='C:/Users/jeffm/AppData/Local/Android/Sdk'

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups
#
### This reverts the +/- operators.
setopt pushdminus

# Set proper variables
export TERM='screen-256color'

# Useful function
up() { local p= i=${1:-1}; while ((i--)); do p+=../; done; cd "$p$2";}

# Zsh vi mode
# doublack.io/words/zsh-vi-mode.html
bindkey -v
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
up() { local p= i=${1:-1}; while (( i-- )); do p+=../; done; cd "$p$2" }
alias ls='ls --color=auto'
alias ll='ls -lah'
alias tt="tmux attach || tmux"
alias archey="clear && screenfetch -t"
alias archey_full="clear && screenfetch -t && echo "" && figlet -k -c -p < /etc/redhat-release"
function open () {
	detach xdg-open "$*"
}
alias clock='tty-clock -sct -C 7'
alias sysinfo='clear && uname -a && echo "" && pacman -V'
alias cls='clear && ls'
alias cll='clear && ll'
alias clc='clear && fc -e - 2> /dev/null' 
alias clm='clear && make'
alias cla='clear && archey'
alias claf='clear && archey_full'
alias venv='. env/bin/activate'

# App Dev stuff

alias start_android='adb start-server && emulator -avd Pixel_3_API_R'
alias start_android_cold='adb start-server && emulator -no-snapshot-load -avd Pixel_3_API_R'
alias search='grep --exclude-dir=node_modules --exclude-dir=.expo -r'

function adb_reverse_forevor() {
    while true; 
    do;
        if [[ $(adb reverse --list | wc -l) -lt 2 ]]; 
        then; 
            echo Running \'adb reverse tcp:$1 tcp:$1\'...; 
            adb reverse tcp:$1 tcp:$1;
            echo Done.;
        fi;
        sleep 1;
    done;
}
# windows stuff
alias copy='putclip'
alias paste='getclip'

