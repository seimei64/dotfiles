" setting
" 文字コードをUTF-8に設定
set fenc=utf-8
" バックアップを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" View
" 行番号を表示
set number
" タイトルを書き換えない
set notitle
" 現在の行を強調表示
set cursorline
" ルーラーを表示
set ruler
" 行末の1文字先までカーソル移動できるようにする
set virtualedit=onemore
" 新しい行を開始した際にインデントを挿入
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時、対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折返し時に表示業単位で移動できるようにする
nnoremap j gj
nnoremap k gk
" ファイルタイプの自動検出とインデントとプラグインの自動読み込み
filetype plugin indent on


" Tab
" 不可視文字を可視化
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" Search
" 小文字と大文字の区別なく検索する
set ignorecase
" 大文字が含まれていたら区別して検索する
set smartcase
" 検索ワード入力時に順次対象にヒットさせる
set incsearch
" 最後まで検索したら最初に戻る
set wrapscan
" ヒットした検索ワードをハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" Input
" BS, Del, Ctrl-W, Ctrl-Uの挙動変更
set backspace=indent,eol,start

" Plugins
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" lightlineのカラースキームを変更
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

" シンタックスハイライトを有効化
syntax on
