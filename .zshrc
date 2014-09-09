# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="brendanjerwin"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew git-extras npm osx pip vagrant colorize colored-man compleat)

source $ZSH/oh-my-zsh.sh
#options
setopt CSH_NULL_GLOB


# Example aliases
alias zshrc="$EDITOR ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias git='hub'
eval "$(hub alias -s)"
alias gup='git smart-pull'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gs='git status --short'
alias grh='git reset --hard'

alias tmux="TERM=screen-256color-bce tmux"
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Customize to your needs...
export EDITOR=vim
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
export GOPATH=$HOME/Projects/go
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

export PATH=/Users/brendanjerwin/.rvm/gems/ruby-1.9.3-p194/bin:/Users/brendanjerwin/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/brendanjerwin/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/brendanjerwin/.rvm/bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/brendanjerwin/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Projects/go/bin
export PATH=$PATH:.

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

eval "$(direnv hook $0)"

compinit
