syntax on
set number
set autoindent

colorscheme industry


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
set shiftwidth=4
set softtabstop=4

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

" Set Scala to be two space indent
autocmd FileType scala setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.ssp set filetype=html
au BufRead,BufNewFile *.jade set filetype=haml
