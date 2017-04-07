# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

ZSH_THEME="original"

plugins=o(git)

autoload -U compinit
compinit

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:`pwd`/bin"

# 鍵の設定
ssh-add -K ~/.ssh/id_rsa_20170327

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
    BUFFER=$((history -n 1 | tac; grep -v '#' ~/.zsh/snippets) | peco --query "$LBUFFER")
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
