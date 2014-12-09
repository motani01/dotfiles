# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="orizinal"
#ZSH_THEME="irobbyrussell"
#ZSH_THEME="steeef"
ZSH_THEME="original"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=o(git)

autoload -U compinit
compinit

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/y/bin64:/home/y/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/motani/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# alias 
alias ls='ls -G'
alias ll='ls -ltar'
alias ctags='ctags -f tags'

#cdとlsの省略
setopt auto_cd
function chpwd() { ls }

# PAHT設定
CDPATH=.:/home/y/logs:/home/y

# oracle 
ORACLE_SID=
ORACLE_HOME=/home/y/libexec/oracle
TNS_ADMIN=/home/y/conf/oracle
#NLS_LANG=Japanese_Japan.JA16EUC
NLS_LANG=Japanese_Japan.AL32UTF8
NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss'
export ORACLE_SID ORACLE_HOME TNS_ADMIN NLS_LANG
export EDITOR=vim

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
export ORACLE_HOME=/home/y/lib64/ora11gclient
export PATH=$ORACLE_HOME:$PATH
export LD_LIBRARY_PATH=/home/y/lib64/ora11gclient
export TERM=xterm-256color
