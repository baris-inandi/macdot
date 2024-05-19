# source brew if available
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# default editor
set -gx EDITOR micro

# default browser
set -gx BROWSER google-chrome-beta
set -gx CHROME_EXECUTABLE google-chrome-beta

# aliases
alias xt="exit"
alias c="clear"
alias m="micro"
alias gsync="bash ~/me/mindot/scripts/gsync.sh $1"
alias htop="btop"
alias clone="luajit ~/me/mindot/scripts/gitclone.lua"
alias ls="exa --group-directories-first -laFh --git --no-user --no-time --octal-permissions --no-permissions $argv"
alias lsd="exa --group-directories-first -laFUmh --git --no-user --octal-permissions --no-permissions $argv"
alias lsx="exa --group-directories-first --icons -laFh --git --no-filesize --no-permissions --no-user --no-time --tree --level 99 $argv"
alias root="cd /"
alias mm="$EDITOR (sk --preview='bat {} --color=always --theme Visual\ Studio\ Dark+')"
alias clean_node_modules="find ~/me -name node_modules -type d -prune -exec trash {} +"

# no greeting
set fish_greeting

################################################################## VS
# opens vscode in the current directory and exits immediately
##################################################################
function vs
    if count $argv >/dev/null
        code $argv
    else
        code .
    end
    exit
end

################################################################## CLEARCACHE
# clears .cache directory and runs paccache -r
##################################################################
function clearcache
    rm -rf ~/.cache
    mkdir ~/.cache
    echo "cache cleared."
end

################################################################## MK
# creates and cds into a directory
##################################################################
function mk -a dir
    mkdir $dir
    cd $dir
end

################################################################## RMTHIS
# uses trash-cli to trash current directory and cds to parent
##################################################################
function rmthis
    set thisdir (basename $PWD)
    cd ..
    trash $thisdir
end

################################################################## D
# cds into directory and calls ls immediately
##################################################################
function d -a dir
    if not test -d $dir
        echo (set_color red)ERROR:(set_color normal) Directory non-existent
        return 1
    end
    cd $dir
    if [ "$PWD" = "$HOME" ]
        echo (set_color cyan)d:(set_color normal) Home directory
    else
        echo (set_color cyan)d:(set_color normal) $PWD
        ls
    end
end

################################################################## MVTHIS
# moves current directory
##################################################################
function mvthis -a name
    set thisdir (basename $PWD)
    cd ..
    mv $thisdir $name
    cd $name
end

set -gx PNPM_HOME "/home/bi/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/bi/.ghcup/bin # ghcup-env

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
