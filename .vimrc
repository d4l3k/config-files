" Tristan Rice's (rice@fn.lc) vimrc file

syntax on
set number
set autoindent


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

:set guioptions-=T  "remove toolbar


" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2

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


set relativenumber

noremap!  <Up>     <NOP>
noremap!  <Down>   <NOP>
noremap!  <Left>   <NOP>
noremap!  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'ervandew/supertab'
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'wikitopian/hardmode'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'fatih/vim-go'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'Valloric/YouCompleteMe'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_go_checkers = ['go', 'govet', 'golint']
let g:syntastic_go_golint_args='-min_confidence=0.3 -shadow_ignore="err"'
let g:syntastic_python_flake8_post_args='--ignore=E221,E111'
let g:syntastic_always_populate_loc_list = 1

let g:go_fmt_command = "goimports"

nmap <F8> :TagbarToggle<CR>

nmap <space> zz

au BufNewFile,BufRead *.ejs set filetype=html

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so ~/.vimrc
augroup END

if has('gui_running')
  colorscheme industry
endif
if has("gui_macvim")
  set transparency=15
endif

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

set clipboard=unnamedplus

set completeopt=longest,menuone

au FileType go nmap <leader>bb :GoBuild<cr>
au FileType go nmap <leader>bt :GoTest<cr>
au FileType go nmap <leader>br :GoRun<cr>
au FileType go nmap <leader>bi :GoInstall<cr>
au FileType go nmap <leader>bc :GoCoverage<cr>

nmap <leader>sc :s#_*\(\u\)\(\u*\)#\1\L\2#g<cr>
