let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'nelstrom/vim-mac-classic-theme'
  Plug 'arcticicestudio/nord-vim'
  Plug 'tribela/vim-transparent'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'mg979/vim-visual-multi'
  Plug 'jiangmiao/auto-pairs'
  Plug 'justinmk/vim-sneak'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-test/vim-test'
call plug#end()
