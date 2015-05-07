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

export PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin"

source ~/.zsh/`uname`.zsh
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
alias ll='ls -ltar'
alias ctags='ctags -f tags'
alias -g P='| peco'
alias reload='exec /bin/zsh -l'
alias history=history # oh my zshの設定を上書きする

#cdとlsの省略
setopt auto_cd
function chpwd() { ls }

# kando設定
setopt auto_pushd # pushdを自動で行う
setopt pushd_ignore_dups # 重複するディレクトリは保存しない
setopt list_packed # 補完候補を表示するときにつめて表示
setopt nolistbeep # no beep sound when complete list displayed
setopt prompt_subst
export WORDCHARS="*?_-.[]~&;!#$%^(){}<>" # 単語に引っかからない記号を定義

export EDITOR=vim
export TERM=xterm-256color

# peco functions
function peco-cmdsearch() {
    BUFFER=$((history -n 1 | tac) | peco --query "$LBUFFER")
    zle clear-screen
}
zle -N peco-cmdsearch
bindkey '^r' peco-cmdsearch

function peco-sshsearch() {
    ssh_server=$((cat ~/.ssh/known_hosts | sed -e 's/[, ].*$//' | sort -u) | peco --query "$LBUFFER")
    if [ -n "$ssh_server" ]; then
        BUFFER="ssh $ssh_server"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-sshsearch
bindkey '^s' peco-sshsearch

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey "^[g" peco-src
