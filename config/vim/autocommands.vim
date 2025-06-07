" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

function! ShowCursorInfo()
    let branch_info = FugitiveStatusline()
    let branch = substitute(branch_info, '.*(\(.*\)).*', '\1', '')
    if strlen(branch) > 0
        echo expand('%:t') . ' - Branch: ' . branch
    else
        echo expand('%:t')
    endif
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

autocmd CursorHold * call ShowCursorInfo()
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType nerdtree let b:NERDTreeZoomed = 1 | wincmd |
autocmd StdinReadPre * let s:std_in=1
autocmd TextYankPost * if (v:event.operator == 'y' || v:event.operator == 'd') | silent! execute 'call system("wl-copy", @")' | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
