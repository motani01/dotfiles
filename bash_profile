if [ -z "${BASH_EXECUTION_STRING}" ]; then
    ZSH="/bin/zsh"
    [ -x "${ZSH}" ] && SHELL="${ZSH}" exec "${ZSH}" -l
fi
