# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################################################
# CUSTOM CONFIG
##################################################################

export BUN_INSTALL="$HOME/.bun"
export EDITOR="micro"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

path+="/opt/homebrew/bin"
path+="$HOME/.cargo/bin"
path+="$HOME/.local/bin"
path+="$BUN_INSTALL/bin"
path+="$HOME/.flutter-sdk/bin"

# aliases
alias xt="exit"
alias c="clear"
alias m="micro"
alias gsync="bash ~/me/macdot/scripts/gsync.sh $@"
alias clone="bash ~/me/macdot/scripts/gitclone.sh $@"
alias ls="lsd -la $argv --config-file ~/me/macdot/config/lsconfig.yml"
alias root="cd /"
alias mm="$EDITOR (sk --preview='bat {} --color=always --theme Visual\ Studio\ Dark+')"
alias clean_node_modules="find ~/me -name node_modules -type d -prune -exec trash {} +"
alias python="python3.13"
alias python3="python3.13"

################################################################## VS
# Opens vscode in the current directory and exits immediately
##################################################################
function vs {
    if [ $# -gt 0 ]; then
        code "$@"
    else
        code .
    fi
    exit
}

################################################################## CLEARCACHE
# Clears .cache directory and runs paccache -r
##################################################################
function clearcache {
    rm -rf ~/.cache
    mkdir ~/.cache
    echo "cache cleared."
}

################################################################## MK
# Creates and cds into a directory
##################################################################
function mk {
    mkdir "$1"
    cd "$1"
}

################################################################## RMTHIS
# Uses trash-cli to trash current directory and cds to parent
##################################################################
function rmthis {
    thisdir=$(basename "$PWD")
    cd ..
    trash "$thisdir"
}

################################################################## D
# Cds into directory and calls ls immediately
##################################################################
function d {
    if [ ! -d "$1" ]; then
        echo "\033[31mERROR:\033[0m Directory non-existent"
        return 1
    fi
    cd "$1"
    if [ "$1" = "$HOME" ]; then
        echo "\033[36md:\033[0m Home directory"
    else
        echo "\033[36md:\033[0m $PWD"
        ls
    fi
}

################################################################## MVTHIS
# Moves current directory
##################################################################
function mvthis {
    thisdir=$(basename "$PWD")
    cd ..
    mv "$thisdir" "$1"
    cd "$1"
}

# bun completions
[ -s "/Users/bi/.bun/_bun" ] && source "/Users/bi/.bun/_bun"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
