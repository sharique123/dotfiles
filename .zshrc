# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nicoulaj"
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
plugins=(git-remote-branch gitfast brew npm osx pip vagrant colorize colored-man compleat)

source $ZSH/oh-my-zsh.sh
#options
export PROMPT="%(0?.%{%{%}%}.%{%{%}%})%{%{%}%}%30<..<${vcs_info_msg_0_%%.}%<<%(!.❯❯❯.❯)%{%{%}%}%{%{%}%}"
setopt CSH_NULL_GLOB

eval `ssh-agent -s`
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
alias ccat='highlight -O ansi'

alias tmux="TERM=screen-256color-bce tmux"
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source ~/.profile

# Customize to your needs...
export HAXE_STD_PATH="/usr/local/lib/haxe/std"
export EDITOR=vim
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
export GOPATH=$HOME/Projects/go
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
export HOMEBREW_GITHUB_API_TOKEN=d25a19f2d54b8431a443f4f0c6516c1fa055ce22

export PATH=$PATH:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin
export PATH=$PATH:$HOME/Projects/go/bin
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:.

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

eval "$(direnv hook $0)"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval $(boot2docker shellinit)
eval $(dvm env)

compinit

PERL_MB_OPT="--install_base \"/Users/brendanjerwin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/brendanjerwin/perl5"; export PERL_MM_OPT;

PERL_MB_OPT="--install_base \"/Users/brendanjerwin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/brendanjerwin/perl5"; export PERL_MM_OPT;

source /Users/brendanjerwin/.iterm2_shell_integration.zsh
