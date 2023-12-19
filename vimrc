" Options
set cmdheight=1
set clipboard=unnamedplus
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set hlsearch
set mouse-=a
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
set signcolumn=no
set linebreak
set scrolloff=15
set sidescrolloff=8
set whichwrap=bs<>[]hl
set laststatus=0
set tabline=%t
set foldcolumn=0

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tribela/vim-transparent'
Plug 'sts10/vim-pink-moon'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme pink-moon

" Set the leader key
let g:mapleader = " "

" Explorer
nnoremap <Leader>f :Explore<CR>
nnoremap <Leader>q :Rex<CR>

" Resize with arrows
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Navigate buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" Move text up and down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Insert
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

" Delete word on CTRL + Backspace
inoremap <C-H> <C-W>

" Clear filter
nnoremap <leader>r :noh<CR>

" New Workspace
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wh :sp<CR>
