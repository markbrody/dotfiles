export PATH="$PATH:$HOME/.local/bin:$HOME/.config/composer/vendor/bin"
export PATH=$PATH:/var/lib/snapd/snap/bin
export PYTHONPATH=$PYTHONPATH:$HOME/.local/bin
export EDITOR=/usr/bin/vim
export CLICOLOR=1
export ZSH=$HOME/.oh-my-zsh
# export PAGER="pspg --quit-if-one-screen"

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
PROMPT="%(?:%F{green}➜ :%F{red}➜ )%F{reset} %m:%1~%F{white}\$(git_branch)%F{reset} %# "

__mycli() {
    if [ "$1x" != "x" ]; then
        /usr/bin/mycli \
            --defaults-file="$HOME/mylogin.cnf" \
            --defaults-file="$HOME/.my.cnf" \
            --login-path=$1
    fi
}

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

csv() {
    cat $1 | pspg --csv --quit-if-one-screen
}

alias ks="ls"
alias bim="vim"
alias mycli="__mycli"

setopt appendhistory autocd extendedglob nomatch notify
setopt PROMPT_SUBST
setopt interactivecomments
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/mark/.zshrc'
autoload -Uz compinit
compinit

# source ~/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

