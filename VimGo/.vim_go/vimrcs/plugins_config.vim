""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim_go/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UnForked plugin 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin ack.vim 
Plug 'mileszs/ack.vim'
" Plugin bufexplorer 
Plug 'corntrace/bufexplorer'
" Plugin ctrlp.vim 
Plug 'kien/ctrlp.vim'
" Plugin mayansmoke 
Plug 'vim-scripts/mayansmoke'
" Plugin nginx.vim 
Plug 'vim-scripts/nginx.vim'
" Plugin open_file_under_cursor.vim 
Plug 'amix/open_file_under_cursor.vim'
" Plugin snipmate-snippets 
Plug 'scrooloose/snipmate-snippets'
" Plugin taglist.vim 
Plug 'vim-scripts/taglist.vim'
" Plugin tlib 
Plug 'vim-scripts/tlib'
" Plugin vim-addon-mw-utils 
Plug 'MarcWeber/vim-addon-mw-utils'
" Plugin vim-bundle-mako 
Plug 'sophacles/vim-bundle-mako'
" Plugin vim-coffee-script 
Plug 'kchmck/vim-coffee-script'
" Plugin vim-colors-solarized 
Plug 'altercation/vim-colors-solarized'
" Plugin vim-indent-object 
Plug 'michaeljsmith/vim-indent-object'
" Plugin vim-less 
Plug 'groenewege/vim-less'
" Plugin vim-markdown 
Plug 'tpope/vim-markdown'
" Plugin vim-pyte 
Plug 'therubymug/vim-pyte'
" Plugin vim-snipmate 
Plug 'garbas/vim-snipmate'
" Plugin vim-snippets 
Plug 'honza/vim-snippets'
" Plugin vim-surround 
Plug 'tpope/vim-surround'
" Plugin vim-expand-region 
Plug 'terryma/vim-expand-region'
" Plugin vim-multiple-cursors 
Plug 'terryma/vim-multiple-cursors'
" Plugin vim-fugitive 
Plug 'tpope/vim-fugitive'
" Plugin vim-airline 
Plug 'bling/vim-airline'
" Plugin goyo.vim 
Plug 'junegunn/goyo.vim'
" Plugin vim-zenroom2 
Plug 'amix/vim-zenroom2'
" Plugin syntastic 
Plug 'scrooloose/syntastic'
" Plugin vim-repeat 
Plug 'tpope/vim-repeat'
" Plugin vim-commentary 
Plug 'tpope/vim-commentary'
" Plugin vim-go 
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plugin netrw.vim 
Plug 'vim-scripts/netrw.vim'
" Plugin neocomplete 
Plug 'Shougo/neocomplete.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Forked plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mru
Plug '~/.vim_go/forked/mru'
"Plugin set_tabline
Plug '~/.vim_go/forked/set_tabline'
" Plugin vim-peepopen
"Plug '~/.vim_go/forked/vim-peepopen'
" Plugin yankring
Plug '~/.vim_go/forked/yankring'
" Plugin zencoding
Plug '~/.vim_go/forked/zencoding'

"""""""""""""""""""""""""""""""""""""
" Plugin tagbar
"Plug 'majutsushi/tagbar'
" Plugin nerdtree
"Plug 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <C-n> :NERDTreeToggle<CR>
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark 
" map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_type_go = {  
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }

"nmap <F8> :TagbarToggle<CR>