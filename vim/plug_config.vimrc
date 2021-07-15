filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set shell=/bin/bash
set hidden

" THEME {{{
set background=dark
" for icon
set encoding=UTF-8
" for vim airline

" NERDTree
" autocmd VimEnter * NERDTree
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
" map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
hi LineNr guibg=bg
set foldcolumn=1
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" For javascript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" FZF
nnoremap f :FZF<CR>
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" bind \ (backward slash) to grep shortcut
nnoremap K :Ag <C-R><C-W><CR>
nnoremap <C-k> /<C-R><C-W><CR>
nnoremap \ :Ag<SPACE>


" YCM
nnoremap ? :YcmCompleter GetDoc<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_hover=""  " this guys is being default at April :))
let g:ycm_complete_in_comments = 1
let g:ycm_semantic_triggers =  {
	\   'c' : ['->', '.'],
	\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
	\             're!\[.*\]\s'],
	\   'ocaml' : ['.', '#'],
	\   'cpp,cuda,objcpp' : ['->', '.', '::'],
	\   'perl' : ['->'],
	\   'php' : ['->', '::'],
	\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
	\   'ruby' : ['.', '::'],
	\   'lua' : ['.', ':'],
	\   'erlang' : [':'],
	\   'python' : ['re!\w{2}'],
	\ }
let g:ycm_filter_diagnostics = {
	\   "javascript": {
	\     "regex": [
	\         "^.* can only be used in a .ts file.$",
	\         "^Duplicate identifier 'type'.$"
	\     ]
	\   }
	\ }
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}
set completeopt-=preview
let g:EclimFileTypeValidate = 0
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_python_binary_path = 'python3'
let g:ycm_key_invoke_completion = '<C-n>'
let g:ycm_disable_for_files_larger_than_kb = 2000
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
au BufNewFile,BufRead *.tsx set filetype=typescript
" nmap <Leader>f :Format <CR>

" Easymotion
" s{char}{char} to move to {char}{char} over windows
nmap <Leader>F <Plug>(easymotion-overwin-f)
" Move to line over windows
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Search n-chars
map / <Plug>(easymotion-sn)

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" fzf.vim
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Auto close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue'
let g:closetag_emptyTags_caseSensitive = 1
let g:jsx_ext_required = 0


" #EMMET {{{
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=' '
imap <expr> <C-e> emmet#expandAbbrIntelligent("\<tab>")
"}}}

" #VIM-FUGITIVE {{{
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gc :Git commit --verbose --quiet<CR>
nmap <silent> <leader>ga :Git commit --amend<CR>
nmap <silent> <leader>gs :Git<CR>
nmap <silent> <leader>gl :Gclog<CR>
"}}}

" RAINBOW
let g:rainbow_active = 1
"}}}


" VIM-FUGITIVE
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gd :Git diff HEAD<CR>
nnoremap <leader>gb :Git branch -a<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gh :diffget //2<CR>
" nnoremap <leader>gl :!git log --decorate --graph --oneline --all<CR>
nnoremap <leader>gl :Git log --decorate --graph --oneline --all<CR>

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" for sidebar
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_altv = 1
let g:netrw_winsize = 80
let g:netrw_browse_split = 2

" for highlight
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

pyx << EOF


