" For moving quickly up and down,
" Goes to the first line above/below that isn't whitespace
" Thanks to: http://vi.stackexchange.com/a/213
nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Helpful delete/change into blackhole buffer
nmap <leader>d "_d
nmap <leader>c "_c
nmap <leader>x "_x
nmap <space>d "_d
nmap <space>c "_c
nmap <space>x "_x

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <silent> <expr> <CR> {-> v:hlsearch ? "<cmd>nohl\<CR>" : "\<CR>"}()
