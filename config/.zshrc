# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

##################################################################
# CUSTOM CONFIG
##################################################################

path+='/opt/homebrew/bin'
path+='$HOME/.cargo/bin'
export PATH

# aliases
alias xt="exit"
alias c="clear"
alias m="micro"
alias gsync="bash ~/me/macdot/scripts/gsync.sh $1"
alias clone="python3 ~/me/macdot/scripts/gitclone.py"
alias ls="lsd -la $argv --config-file ~/me/macdot/config/lsconfig.yml"
alias root="cd /"
alias mm="$EDITOR (sk --preview='bat {} --color=always --theme Visual\ Studio\ Dark+')"
alias clean_node_modules="find ~/me -name node_modules -type d -prune -exec trash {} +"
alias python="python3"

# Default editor
export EDITOR="micro"

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

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# bun completions
[ -s "/Users/bi/.bun/_bun" ] && source "/Users/bi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
