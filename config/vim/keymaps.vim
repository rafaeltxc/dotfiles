let g:mapleader = " "

nnoremap p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap <leader>e :!%:p

nnoremap <C-S-Up> :resize +2<CR>
nnoremap <C-S-Down> :resize -2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

inoremap jk <ESC>
inoremap kj <ESC>

vnoremap < <gv
vnoremap > >gv

vnoremap <S-j> :m .+1<CR>==
vnoremap <S-k> :m .-2<CR>==

vnoremap p "_dP
xnoremap J :move '>+0<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

xnoremap <S-j> :move '>+1<CR>gv-gv
xnoremap <S-k> :move '<-2<CR>gv-gv

nnoremap cc "_cc
vnoremap c "_c

nnoremap <leader>r :noh<CR>
nnoremap <leader>c :bd!<CR>
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wh :sp<CR>
nnoremap <C-t> :term<CR>

nnoremap <silent> <Leader>f :call ReloadNERDTree()<CR>
nnoremap <Leader>tf :Files<CR>
nnoremap <Leader>tl :Rg<CR>
nnoremap <Leader>tb :Buffers<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <Leader>ab :Git blame<CR>
nnoremap <Leader>al :Git log<CR>
nnoremap <Leader>ad :Git diff<CR>
nnoremap <Leader>as :Git status<CR>
nnoremap <silent> C :call ShowDocumentation()<CR>

nmap <silent> <leader>qu :TestNearest<CR>
nmap <silent> <leader>qf :TestFile<CR>
nmap <silent> <leader>qs :TestSuite<CR>
nmap <silent> <leader>ql :TestLast<CR>
nmap <silent> <leader>qv :TestVisit<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

