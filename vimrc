:set nocompatible
filetype off

" indentation
:set autoindent
:set shiftwidth=4
:set smarttab
:set tabstop=4
:set expandtab
let g:SuperTabDefaultCompletionType = 'context'

" searchOptions
:set hlsearch
:set ignorecase
:set incsearch
:set smartcase

" textRendering
syntax enable
:set encoding=utf-8
:set spelllang=en_us
:set wrap
:set linebreak
:set wildmenu
:set showcmd
:set showmatch

" interfaceOptions
:set mouse=c
:set number
:set noerrorbells
:set title
:set background=dark

" miscelaneous
:set scrolloff=10
:set history=1000
:set undolevels=1000
:set ruler
nnoremap <f12> :nohlsearch<CR>

" spell highlight
hi SpellBad cterm=underline,bold ctermbg=none ctermfg=none
hi Cursor cterm=underline ctermbg=none ctermfg=none
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" line extra spaces
highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/

" calling plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'mbbill/undotree' " undo history
Plug 'itchyny/lightline.vim' " status line
Plug 'itchyny/vim-gitbranch' " gitBranch
Plug 'tpope/vim-fugitive' " add git commands
Plug 'tpope/vim-commentary' " comment command
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multicursor
Plug 'sheerun/vim-polyglot' " vim languages
Plug 'airblade/vim-gitgutter' " git diff
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-html coc-pyright coc-java coc-sql docker-langserver'} " auto completion
Plug 'ap/vim-buftabline' " tabs control
Plug 'preservim/nerdtree' " system explorer
Plug 'tpope/vim-surround' " word surround
Plug 'dikiaap/minimalist' " colorScheme
Plug 'ervandew/supertab' "superTab      

" List ends here. Plugins become visible to Vim after this call.
call plug#end()     
     
colorscheme minimalist
     
" pluginSettings     
     
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "undodir", 0700)
    endif
    let &undodir=target_path
    set undofile
endif     
" status line     
:set t_Co=256     
:set laststatus=2    
:set noshowmode     
     
let g:lightline = {  
      \ 'colorscheme': 'wombat',
	  \     
      \ 'active': {  
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },     
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },     
      \ }     
" auto comment     
autocmd Filetype html setlocal commentstring=<!--%s-->
autocmd Filetype python setlocal commentstring="""%s"""
autocmd Filetype java setlocal commentstring=/*%s*/
" undoTree      
nnoremap <F3> :UndotreeToggle<CR>
" coc
" remove new line when tab selection autocomplete
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" buf tab
:set hidden
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>
" nerdtree       
nnoremap <F2> :NERDTreeToggle<CR>
      
