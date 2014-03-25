"------------------------------------------------------------------------"
"                             NeoBundle start
"------------------------------------------------------------------------"
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
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
      call neobundle#rc(expand('~/.vim/bundle/'))
      call s:LoadBundles()
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
se hidden
colorscheme molokai 
nmap <Space>n :bn<CR>
nmap <Space>p :bp<CR>
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
