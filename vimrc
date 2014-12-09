"------------------------------------------------------------------------"
"                             NeoBundle start
"------------------------------------------------------------------------"
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme molokai
  " その他の処理
endfunction
 
" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'kien/ctrlp.vim.git'
  NeoBundle 'scrooloose/nerdtree.git'
  NeoBundle 'scrooloose/syntastic.git'
  NeoBundle 'fholgado/minibufexpl.vim'
  NeoBundle 'vim-scripts/xoria256.vim'
  NeoBundle 'tomasr/molokai'
  NeoBundle "vim-scripts/taglist.vim"
  NeoBundle 'bling/vim-airline'
  NeoBundle 'vim-scripts/sudo.vim.git'
  NeoBundle 'StanAngeloff/php.vim.git'
  " ...
  " 読み込んだプラグインの設定
  " ...
endfunction
 
" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle/'))
      call s:LoadBundles()
      call neobundle#end()
      colorscheme molokai
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif
 
  filetype indent plugin on
  syntax on
endfunction
 
call s:InitNeoBundle()
"------------------------------------------------------------------------"
"                             NeoBundle end
"------------------------------------------------------------------------"

"------------------------------------------------------------------------"
"			my setting
"------------------------------------------------------------------------"
se cindent
se hidden
se tabstop=4
se softtabstop=4
se shiftwidth=4
se number
se hlsearch
se expandtab
se list
se listchars=tab:^\ ,trail:_
set laststatus=2
"set fenc=euc-jp
"set enc=euc-jp
set fenc=utf-8
set enc=utf-8
"se tags=.tags;
set nobackup
set swapfile

nmap <Space>n :bn<CR>
nmap <Space>p :bp<CR>
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

