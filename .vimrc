" 互換モードオフ
set nocompatible
" 行番号表示
set number
" コマンドライン補完
set wildmenu
" コマンドラインの行数
set cmdheight=2
" 色付け
syntax on
set t_Co=256
" 検索時に大文字・小文字を区別しない。
" ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" バッファを保存しなくても他のバッファを表示できるようにする
set hidden
" インデント
set autoindent
set smartindent
set tabstop=4
" バックアップファイル
set backupdir=$HOME/vimbackup
" 画面最下行にルーラーを表示する
set ruler
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" 不可視文字表示
set list
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%

" タブ切り替え
nnoremap <C-n> gt
nnoremap <C-p> gT

