##################################################
# Mac用の設定ファイル
##################################################
alias gvim='open /Applications/MacVim.app'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='open -a Preview'
alias tac='tail -r'
alias hube='GITHUB_HOST=git.corp.yahoo.co.jp hub'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# require coreutils
# ex. brew install coreutils
PATH=`pwd`/.bin/Darwin:$PATH
# alias ls='gls --color'
if [ -f ~/.dir_colors ]; then
    eval `gdircolors -b ~/.dir_colors`
fi
