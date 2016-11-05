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

set guifont=Monaco\ for\ Powerline:h12


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

" Switch between panes easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a


" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intelligence!
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

set colorcolumn=80,100

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

" Required:
if has('nvim')
  let b:path = '~/.vim/bundle-nvim'
  set runtimepath+=~/.vim/bundle-nvim/repos/github.com/Shougo/dein.vim/
else
  let b:path = '~/.vim/bundle'
  set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim/
end

call dein#begin(expand(b:path))

"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('flazz/vim-colorschemes')
"call dein#add('majutsushi/tagbar')
"call dein#add('scrooloose/nerdtree')
"call dein#add('tpope/vim-unimpaired')
"call dein#add('wikitopian/hardmode')
"call dein#add('xolox/vim-easytags')
"call dein#add('xolox/vim-misc'
call dein#add('kchmck/vim-coffee-script')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Lokaltog/vim-easymotion')
call dein#add('Shougo/dein.vim')
"call dein#add('godlygeek/tabular')
"call dein#add('plasticboy/vim-markdown')
"call dein#add('lervag/vimtex')
"call dein#add('sourcegraph/sourcegraph-vim')
"call dein#add('sourcegraph-beta/sourcegraph-vim-beta')
call dein#add('rhysd/vim-clang-format')
if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('mhartington/deoplete-typescript')
  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  call dein#add('neomake/neomake')
  call dein#add('sbdchd/neoformat')
else
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('mrtracy/syntastic', { 'rev': 'mtracy/tsc_tsproj' })
endif
call dein#add('leafgarland/typescript-vim')
call dein#add('fatih/vim-go')
call dein#add('Shougo/vimshell')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ianks/vim-tsx')
call dein#add('nsf/gocode', {'rtp': 'vim/'})
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tikhomirov/vim-glsl')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-sleuth')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('wavded/vim-stylus')
call dein#add('rking/ag.vim')


call dein#end()

let g:typescript_indent_disable = 1

" Required:
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map L <Plug>(easymotion-bd-jk)
nmap L <Plug>(easymotion-overwin-line)

" Move to word
map  w <Plug>(easymotion-bd-w)
nmap w <Plug>(easymotion-overwin-w)

let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['govet', 'golint', 'errcheck']
let g:syntastic_go_govet_exec = 'go tool vet'
let g:syntastic_go_govet_args = '-printfuncs=Errorf:1'
let g:syntastic_go_golint_args='-min_confidence=0.3 -shadow_ignore="err"'
let g:syntastic_python_flake8_post_args='--ignore=E221,E111'
let g:syntastic_typescript_tsx_checkers = ['typescript/tsx', 'typescript/tslint']
let g:syntastic_typescript_tsc_post_args='--experimentalDecorators --jsx react'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

if has('nvim')
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  " Use smartcase.
  let g:deoplete#enable_smart_case = 1
  " deoplete tab-complete
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

  let g:neoformat_typescript_clangformat = {'exe': 'clang-format', 'args':  ['-fallback-style=Google']} " neoformat#formatters#c#clangformat()
  let g:neoformat_enabled_typescript = ['clangformat']

  autocmd! BufWritePost * Neomake
  set cb=unnamed
  autocmd BufEnter,FocusGained * checktime

  let g:neomake_typescript_tsc_args = ['--experimentalDecorators']
  " set termguicolors
else
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
endif

autocmd! BufWritePost *.ts ClangFormat
let g:airline_detect_spell=0

let g:go_fmt_command = "goimports"

let g:SOURCEGRAPH_AUTO = "false"

nmap <F8> :TagbarToggle<CR>

au BufNewFile,BufRead *.ejs set filetype=html

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so ~/.vimrc
augroup END

augroup terminal
  autocmd TermOpen * setlocal nospell
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized

if has("gui_macvim")
  "set transparency=15
endif

if !has('nvim')
  set enc=utf-8
endif
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set breakindent

" vim-markdown configuration
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1

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
    set clipboard=unnamed

endif

set ttimeoutlen=0

set completeopt=longest,menuone

au FileType go nmap <leader>bb :GoBuild<cr>
au FileType go nmap <leader>bt :GoTest<cr>
au FileType go nmap <leader>br :GoRun<cr>
au FileType go nmap <leader>bi :GoInstall<cr>
au FileType go nmap <leader>bc :GoCoverage<cr>
au FileType go nmap gc :GoReferrers<cr>

nmap <leader>sc :s#_*\(\u\)\(\u*\)#\1\L\2#g<cr>
nmap [l :lprev<cr>
nmap ]l :lnext<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ag_working_path_mode="r"

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ttyfast
set tw=80

" Terminal movement commands.
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
