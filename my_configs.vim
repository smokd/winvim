""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CWD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd D:\Wally\Documents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clang-Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:clang_library_path='C:\Program Files (x86)\LLVM\bin'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif
let g:clang_sort_algo = "alpha"
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_ctags_bin = 'C:\ctags58\ctags.exe'
"nnoremap <silent> <F6> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#auto_vim_configuration = 0 
let g:jedi#popup_select_first = 0 
let g:jedi#completions_enabled = 0 
let g:jedi#show_call_signatures = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup                               = 0
" Use neocomplete.
" Auto-select
let g:neocomplete#enable_auto_select                    = 1
" Overwrite completefunc
let g:neocomplete#force_overwrite_completefunc          = 1
let g:neocomplete#enable_at_startup                     = 1
" Use smartcase.
let g:neocomplete#enable_smart_case                     = 1
" Set minimum syntax keyword length.
let g:neocomplete#manual_completion_start_length        = 0
let g:neocomplete#sources#syntax#min_keyword_length     = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#auto_completion_start_length          =2
let g:neocomplete#enable_auto_close_preview             =1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-Space> neocomplete#start_manual_complete('omni')
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
call neocomplete#custom#source('_', 'sorters', [])
if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.typescript = '.*'
let g:neocomplete#sources#omni#input_patterns.javascript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" For clang_complete
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.python ='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:neocomplete#sources.cs = ['omni']
let g:neocomplete#enable_refresh_always = 1
let g:echodoc_enable_at_startup = 1

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Avoid no write error
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set confirm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim + Powershell
"set shell=Powershell
"set shellcmdflag=-command

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = 'C:\ctags58\ctags.exe'
let Tlist_Close_On_Select=0
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1

""""""""""""""""""""""""""""
" => Single Compile
""""""""""""""""""""""""""""
nmap <F11> :SCCompile<cr>
nmap <F12> :SCCompileRun<cr>
call SingleCompile#SetPriority('cpp', 'g++', 50)
call SingleCompile#SetPriority('cpp', 'msvc90', 95)
call SingleCompile#SetPriority('cpp', 'msvc110', 85)
call SingleCompile#SetPriority('cpp', 'msvc100', 90)
call SingleCompile#SetPriority('c', 'gcc', 50)
call SingleCompile#SetPriority('c', 'msvc90', 80)
call SingleCompile#SetPriority('c', 'msvc100', 95)
call SingleCompile#SetPriority('c', 'msvc110', 60)

"""""""""Python-mode""""""""""
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
" Whole Plugin
let g:pymode = 1

let g:pymode_rope = 0
let g:pymode_rope_vim_completion=0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_complete_on_dot = 0
" Documentation
let g:pymode_doc =1 
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_zOwrite = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert "monokai,wombat,molokai,badwolf,,xoria256,solarized,codeschool,vividchalk,mophiadark,mdark 
set gfn=Consolas "Cousine ProgCleanCo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * NERDTree 
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pdf$', '\.PDF$','\.jpg$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead *.txt setlocal spell
au BufRead *.markdown setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'badwolf'
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '||'
"let g:airline_symbols.whitespace = 'Ξ'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta guibg=#E61F1F
call matchadd('ColorColumn', '\%81v', 100)
"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"set transparency=5
set cursorline  				" highlight current line
hi cursorline guibg=#333333 	" highlight bg color of current line
hi CursorColumn guibg=#E51F1F  " highlight cursor

"inoremap <C-Space> <C-x><C-o>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PopUp Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoSnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:neosnippet#disable_runtime_snippets = {
"    \   '_' : 1,
"    \ }                 "Disable all runtime snippets _=1
"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"" SuperTab like snippets' behavior.
""imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"" \ "\<Plug>(neosnippet_expand_or_jump)"
"" \: pumvisible() ? "\<C-n>" : "\<TAB>"
""smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"" \ "\<Plug>(neosnippet_expand_or_jump)"
"" \: "\<TAB>"
"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"
"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory = '$HOME\.vim_runtime\sources_non_forked\vim-snippets\snippets\'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set colorcolumn=81
set completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsSnippetsDir        = '~/.vim/snippets/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsExpandTrigger='<C-CR>'
let g:UltiSnipsJumpForwardTrigger='<A-a>'
let g:UltiSnipsJumpBackwardTrigger='<A-d>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


