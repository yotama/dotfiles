" 互換モードオフ
set nocompatible

" NeoBundle
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'karakaram/vim-quickrun-phpunit'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'tpope/vim-fugitive'

filetype plugin on
filetype indent on

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
set shiftwidth=4
set expandtab
"set softtabstop=0
" バックアップファイル
set backupdir=$HOME/.vimbackup
" 画面最下行にルーラーを表示する
set ruler
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>
" 不可視文字表示
set list
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%

" タブ切り替え
nnoremap <C-n> gt
nnoremap <C-p> gT

" インサートモード
inoremap <silent> jj <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>
" カーソル後の文字削除
inoremap <silent> <C-d> <Del>

" 日付挿入
nmap <F6> <ESC>i<C-R>=strftime("[%Y-%m-%d %H:%M:%S]")<CR><CR>

" クリップボード
set clipboard=unnamed

" NERDTree
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
        autocmd VimEnter * NERDTree ./
endif

nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeIgnore=['\.swp$', '\.bak$']

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" 保存時に対象ディレクトリが存在しなければ作成
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(a:dir, 'p')
    endif
  endfunction 
augroup END

" 実装コードとテストコードを切り替える(Kohana用)
function! SwitchCode()
  let name = expand('%:t:r')
  if matchend(name, 'Test') == strlen(name)
    let path = expand('%:s?tests?classes?:s?Test??:p')
  else
    let path = expand('%:s?classes?tests?:r') . 'Test.'. expand('%:e')
  endif
  execute ':e ' . path
endfunction
nnoremap <silent> <C-T> :call SwitchCode()<CR>

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

" 初期化
let g:quickrun_config = {}
let g:quickrun_config['_'] = {}
let g:quickrun_config['_']['runner'] = 'vimproc'
let g:quickrun_config['_']['runner/vimproc/updatetime'] = 100

" PHPUnit
let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['cmdopt']= '--bootstrap /home/ttamari/works/shp_darkside_batch/src/application/tests/bootstrap_all_modules.php'
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
let g:quickrun_config['phpunit']['outputter/phpunit/height'] = 3
let g:quickrun_config['phpunit']['outputter/phpunit/running_mark'] = 'running...'
let g:quickrun_config['phpunit']['outputter/phpunit/auto_open'] = 0
