" Tristan Rice's (rice@fn.lc) vimrc file

syntax on
set number
set autoindent
set relativenumber

" Create backup dirs
function! InitBackupDir()
  let l:separator = '.'
  let l:parent = $HOME . '/' . l:separator . 'vim/'
  let l:backup = l:parent . 'backup/'
  let l:tmp = l:parent . 'tmp/'
  if exists('*mkdir')
    if !isdirectory(l:parent)
      call mkdir(l:parent)
    endif
    if !isdirectory(l:backup)
      call mkdir(l:backup)
    endif
    if !isdirectory(l:tmp)
      call mkdir(l:tmp)
    endif
  endif
  let l:missing_dir = 0
  if isdirectory(l:tmp)
    execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if isdirectory(l:backup)
    execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if l:missing_dir
    echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
    echo 'Try: mkdir -p' l:backup
    echo 'and: mkdir -p' l:tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
set guioptions-=T  "remove toolbar
set guioptions-=L "remove scrollbars
set guioptions-=r "remove scrollbars
set laststatus=2

set guifont=Monaco\ for\ Powerline:h12


" Necessary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Spaces are better than a tab character
set expandtab
set smarttab


" Use English for spell checking,
if version >= 700
   set spl=en spell
   set spell
endif

" Switch between panes easier
nnoremap <nowait> <C-J> <C-W><C-J>
nnoremap <nowait> <C-K> <C-W><C-K>
nnoremap <nowait> <C-L> <C-W><C-L>
nnoremap <nowait> <C-H> <C-W><C-H>


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

" Since I use Linux, I want this
let g:clipbrdDefaultReg = '+'


" Set off the other parent
highlight MatchParen ctermbg=4

" Set backup location
set backup

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
"call dein#add('dodie/vim-disapprove-deep-indentation')
"call dein#add('dhruvasagar/vim-table-mode')
"call dein#add('godlygeek/tabular')
"call dein#add('plasticboy/vim-markdown')
"call dein#add('lervag/vimtex')
"call dein#add('sourcegraph/sourcegraph-vim')
"call dein#add('sourcegraph-beta/sourcegraph-vim-beta')
call dein#add('rhysd/vim-clang-format')
if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
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
call dein#add('JuliaEditorSupport/julia-vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('fatih/vim-go')
call dein#add('Shougo/vimshell')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ianks/vim-tsx')
"call dein#add('nsf/gocode', {'rtp': 'vim/'})
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tikhomirov/vim-glsl')
"call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-sleuth')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('wavded/vim-stylus')
call dein#add('rking/ag.vim')
call dein#add('vim-pandoc/vim-pandoc-syntax')


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
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_html_checkers = ['standard']
let g:syntastic_html_standard_args = '--plugin html'
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
  inoremap <nowait><silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
  call deoplete#custom#source('jedi', 'is_debug_enabled', 0)

  let g:neoformat_typescript_clangformat = {'exe': 'clang-format', 'args':  ['-fallback-style=Google']} " neoformat#formatters#c#clangformat()
  let g:neoformat_enabled_typescript = ['clangformat']

  autocmd! BufWritePost * Neomake
  set cb=unnamed
  autocmd BufEnter,FocusGained * checktime

  let g:neomake_typescript_tsc_args = ['--experimentalDecorators']
  let g:neomake_html_standard_maker = {
      \ 'args': ['--plugin','html'],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }
  let g:neomake_javascript_standard_maker = {
      \ 'args': [],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }
  let g:neomake_html_enabled_makers = ['tidy', 'standard']
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_go_gometalinter_args = [] "'--disable-all', '--enable=errcheck', '--enable=megacheck']
  "let g:neomake_go_enabled_makers = ['go']
  "let g:neomake_verbose = 3

  set termguicolors
  let g:terminal_color_0 = "#073642" " s:base02
  let g:terminal_color_1 = "#dc322f" " s:red
  let g:terminal_color_2 = "#719e07" " s:green
  let g:terminal_color_3 = "#b58900" " s:yellow
  let g:terminal_color_4 = "#268bd2" " s:blue
  let g:terminal_color_5 = "#d33682" " s:magenta
  let g:terminal_color_6 = "#2aa198" " s:cyan
  let g:terminal_color_7 = "#eee8d5" " s:base2
  let g:terminal_color_8 = "#002b36" " s:base03
  let g:terminal_color_9 = "#cb4b16" " s:orange
  let g:terminal_color_10 = "#586e75" " s:base01
  let g:terminal_color_11 = "#657b83" " s:base00
  let g:terminal_color_12 = "#839496" " s:base0
  let g:terminal_color_13 = "#6c71c4" " s:violet
  let g:terminal_color_14 = "#93a1a1" " s:base1
  let g:terminal_color_15 = "#fdf6e3" " s:base3
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


" Make cursor wrap properly.
"nnoremap <nowait> j gj
"nnoremap <nowait> k gk
"vnoremap <nowait> j gj
"vnoremap <nowait> k gk
"nnoremap <nowait> <Down> gj
"nnoremap <nowait> <Up> gk
"vnoremap <nowait> <Down> gj
"vnoremap <nowait> <Up> gk
"inoremap <nowait> <Down> <C-o>gj
"inoremap <nowait> <Up> <C-o>gk

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

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ag_working_path_mode="r"

let g:table_mode_corner="|"

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ttyfast
set tw=80

" Terminal movement commands.
tnoremap <nowait> <A-h> <C-\><C-n><C-w>h
tnoremap <nowait> <A-j> <C-\><C-n><C-w>j
tnoremap <nowait> <A-k> <C-\><C-n><C-w>k
tnoremap <nowait> <A-l> <C-\><C-n><C-w>l
nnoremap <nowait> <A-h> <C-w>h
nnoremap <nowait> <A-j> <C-w>j
nnoremap <nowait> <A-k> <C-w>k
nnoremap <nowait> <A-l> <C-w>l

tnoremap <nowait> <C-h> <C-\><C-n><C-w>h
tnoremap <nowait> <C-j> <C-\><C-n><C-w>j
tnoremap <nowait> <C-k> <C-\><C-n><C-w>k
tnoremap <nowait> <C-l> <C-\><C-n><C-w>l
nnoremap <nowait> <C-h> <C-w>h
nnoremap <nowait> <C-j> <C-w>j
nnoremap <nowait> <C-k> <C-w>k
nnoremap <nowait> <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE

" Pandoc markdown
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Speed up syntax highlighting
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=300
set re=1

let @e = "oif err != nil {\nreturn err\n}\<Esc>k$b"
let @w = "Iif \<Esc>A; err != nil {\nreturn err\n}\<Esc>k$b"

" Indent wrapped lines 2 spaces more than parent.
set breakindentopt=shift:2

command! Rdr :redraw! | :set mouse= | :set mouse=a

command! Http :tabe | :term http-server -c0 -g
