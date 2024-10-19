" Options
set cmdheight=1
set clipboard=unnamedplus " Gvim needed to use the system clipboard in case of x11.
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set hlsearch
set mouse=a
set mousemoveevent
set pumheight=10
set showmode
set showtabline=1
set smartcase
set smartindent
set splitbelow
set splitright
set termguicolors
" set timeout
" set timeoutlen=200
set undofile
set updatetime=300
set writebackup
set expandtab
set shiftwidth=2
set autoindent
set tabstop=2
set number
set relativenumber
set numberwidth=2
set linebreak
set scrolloff=15
set sidescrolloff=8
set whichwrap=bs<>[]hl
set laststatus=1
set tabline=%t
set signcolumn=yes
set foldcolumn=0
set foldmethod=indent
set nowrap
set nolinebreak
set nofoldenable
set nobackup
set nowritebackup

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Customization
Plug 'nelstrom/vim-mac-classic-theme' " ColorScheme - Light
Plug 'arcticicestudio/nord-vim' " ColorScheme - Dark
Plug 'tribela/vim-transparent' " Makes vim background transparent

" Misc
Plug 'nvim-lua/plenary.nvim' " Core basic plugin usability functions
Plug 'sheerun/vim-polyglot' " Enable vim into many filetypes

" Utils
Plug 'tpope/vim-commentary' " Handling comments
Plug 'mg979/vim-visual-multi' " Multi cursors
Plug 'jiangmiao/auto-pairs' " Automatic double pairs
Plug 'justinmk/vim-sneak' " Jump across the code
Plug 'Yggdroot/indentLine' " Identation lines
Plug 'airblade/vim-gitgutter' " Git signs

" Chore
Plug 'preservim/nerdtree' " File explorer
Plug 'tpope/vim-fugitive' " Git perks
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " LSP and autocompletion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'vim-test/vim-test' " Testing plugin

call plug#end()

" colorscheme mac_classic
colorscheme nord

" Set the leader key
let g:mapleader = " "

" Remap to clipboard
autocmd TextYankPost * if (v:event.operator == 'y' || v:event.operator == 'd') | silent! execute 'call system("wl-copy", @")' | endif
nnoremap p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

" Execute current file
nnoremap <leader>e :!%:p

" Resize with arrows
nnoremap <C-S-Up> :resize +2<CR>
nnoremap <C-S-Down> :resize -2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

" Navigate window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigate buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" Move text up and down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Exit Insert
inoremap jk <ESC>
inoremap kj <ESC>

" Visual
vnoremap < <gv
vnoremap > >gv
vnoremap <S-j> :m .+1<CR>==
vnoremap <S-k> :m .-2<CR>==
vnoremap p "_dP

" Visual Block
xnoremap J :move '>+0<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap <S-j> :move '>+1<CR>gv-gv
xnoremap <S-k> :move '<-2<CR>gv-gv

" Custom Keymaps
nnoremap cc "_cc
vnoremap c "_c

" Clear filter
nnoremap <leader>r :noh<CR>

" Close buffer
nnoremap <leader>c :bd!<CR>

" New Workspace
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wh :sp<CR>

" Open terminal
nnoremap <C-t> :term<CR>

" Reload NERDTree on every call
function! ReloadNERDTree()
    if exists("t:NERDTreeBufName")
        exec 'NERDTreeClose'
    endif
    if bufname('%') != ''
      exec 'NERDTreeFind'
    else
      exec 'NERDTreeToggle'
    endif
endfunction

" Map a key to call the function
nnoremap <silent> <Leader>f :call ReloadNERDTree()<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Quit on file select
let NERDTreeQuitOnOpen=1

" Maximize window
autocmd FileType nerdtree let b:NERDTreeZoomed = 1 | wincmd |

" FZF
" Initialize configuration dictionary
let g:fzf_vim = {}
nnoremap <Leader>tf :Files<CR>
nnoremap <Leader>tl :Rg<CR>
nnoremap <Leader>tb :Buffers<CR>

" Indent line
let g:indentLine_char_list = ['|', '|', '|', '|']

" LSP (coc)
let g:coc_global_extensions = [
  \'coc-snippets',
  \'coc-pairs',
  \'coc-tsserver',
  \'coc-eslint',
  \'coc-json',
  \'coc-java',
  \'coc-vetur',
  \'coc-xml',
\]

" Java language server configuration
" Lombok handling
let g:coc_java_opts = {
  \'JAVA_TOOL_OPTIONS': '-javaagent:~/.vim/lombok.jar -Xbootclasspath/p:~/.vim/lombok.jar'
\}

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> C :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Fugitive (Git)
nnoremap <Leader>ab :Git blame<CR>
nnoremap <Leader>al :Git log<CR>
nnoremap <Leader>ad :Git diff<CR>
nnoremap <Leader>as :Git status<CR>

" Vim test
nmap <silent> <leader>qu :TestNearest<CR>
nmap <silent> <leader>qf :TestFile<CR>
nmap <silent> <leader>qs :TestSuite<CR>
nmap <silent> <leader>ql :TestLast<CR>
nmap <silent> <leader>qv :TestVisit<CR>

" Show current file name on status line if cursor is not moving
function! ShowCursorInfo()
    let branch_info = FugitiveStatusline()
    let branch = substitute(branch_info, '.*(\(.*\)).*', '\1', '')
    if strlen(branch) > 0
        echo expand('%:t') . ' - Branch: ' . branch
    else
        echo expand('%:t')
    endif
endfunction

autocmd CursorHold * call ShowCursorInfo()

