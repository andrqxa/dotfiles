" Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3
 
 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplete#undo_completion()
 inoremap <expr><C-l>     neocomplete#complete_common_string()
 
 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
     return neocomplete#close_popup() . "\<CR>"
 endfunction
 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplete#close_popup()
 inoremap <expr><C-e>  neocomplete#cancel_popup()
 
 " Go related mappings
 au FileType go nmap <Leader>i <Plug>(go-info)
 au FileType go nmap <Leader>gd <Plug>(go-doc)
 au FileType go nmap <Leader>r <Plug>(go-run)
 au FileType go nmap <Leader>b <Plug>(go-build)
 au FileType go nmap <Leader>t <Plug>(go-test)
 au FileType go nmap gd <Plug>(go-def-tab)

" Netrw Style Listing
 let g:netrw_liststyle = 3
 
 nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h