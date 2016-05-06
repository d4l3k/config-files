" Tristan Rice's (rice@fn.lc) vimrc file

syntax on
set number
set autoindent
set relativenumber


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
set guioptions-=T  "remove toolbar
set guioptions-=L "remove scrollbars
set guioptions-=r "remove scrollbars
set laststatus=2

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10


" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Spaces are better than a tab character
set expandtab
set smarttab


" Use english for spellchecking,
if version >= 700
   set spl=en spell
   set spell
endif


" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a


" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase


" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'


" Set off the other paren
highlight MatchParen ctermbg=4

" Set backup location
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Make cursor wrap properly.
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set colorcolumn=80

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Set Scala to be two space indent
" autocmd FileType scala setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.ssp set filetype=html
au BufRead,BufNewFile *.jade set filetype=haml

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Updated tags in background
let g:easytags_async = 1

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim/

" Required:
call dein#begin(expand('~/.vim/bundle'))

"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('flazz/vim-colorschemes')
"call dein#add('majutsushi/tagbar')
"call dein#add('scrooloose/nerdtree')
"call dein#add('tpope/vim-unimpaired')
"call dein#add('wikitopian/hardmode')
"call dein#add('xolox/vim-easytags')
"call dein#add('xolox/vim-misc')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimshell')
call dein#add('Valloric/YouCompleteMe')
call dein#add('altercation/vim-colors-solarized')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('fatih/vim-go')
call dein#add('leafgarland/typescript-vim')
call dein#add('nsf/gocode', {'rtp': 'vim/'})
call dein#add('scrooloose/syntastic')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tikhomirov/vim-glsl')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-sleuth')
call dein#add('unblevable/quick-scope')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ })



call dein#end()

" Required:
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif


let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['go', 'govet', 'golint']
let g:syntastic_go_golint_args='-min_confidence=0.3 -shadow_ignore="err"'
let g:syntastic_python_flake8_post_args='--ignore=E221,E111'
let g:syntastic_typescript_tsc_post_args='--experimentalDecorators'
let g:syntastic_always_populate_loc_list = 1

let g:go_fmt_command = "goimports"

nmap <F8> :TagbarToggle<CR>

nmap <space> zz

au BufNewFile,BufRead *.ejs set filetype=html

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so ~/.vimrc
augroup END

set background=dark
colorscheme solarized

if has("gui_macvim")
  set transparency=15
endif

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set breakindent

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

if !has('nvim')
    set clipboard=unnamedplus
endif

set ttimeoutlen=0

set completeopt=longest,menuone

au FileType go nmap <leader>bb :GoBuild<cr>
au FileType go nmap <leader>bt :GoTest<cr>
au FileType go nmap <leader>br :GoRun<cr>
au FileType go nmap <leader>bi :GoInstall<cr>
au FileType go nmap <leader>bc :GoCoverage<cr>

nmap <leader>sc :s#_*\(\u\)\(\u*\)#\1\L\2#g<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ttyfast
