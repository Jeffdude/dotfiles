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

autoload -U promptinit
promptinit
prompt redhat

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups
#
### This reverts the +/- operators.
setopt pushdminus

# Set proper variables
export TERM='xterm-256color'

# Zsh vi mode
# doublack.io/words/zsh-vi-mode.html
bindkey -v
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    zle reset-prompt
}
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