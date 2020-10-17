##################################################
# Mac用の設定ファイル
##################################################
alias gvim='open /Applications/MacVim.app'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='open -a Preview'
alias tac='tail -r'
alias hube='GITHUB_HOST=github.com hub'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# require coreutils
# ex. brew install coreutils
PATH=`pwd`/.bin/Darwin:$PATH
# alias ls='gls --color'
if [ -f ~/.dir_colors ]; then
    eval `gdircolors -b ~/.dir_colors`
fi

# memo
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
alias memocat='memo list --fullpath | peco | xargs cat'

# 鍵の設定
ssh-add -K ~/.ssh/id_rsa
