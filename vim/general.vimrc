" FOR GENERAL CONFIG

" THEMES 
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd BufEnter * :highlight Normal ctermbg=NONE ctermfg=NONE
let g:colors_name = 'dracula'

" FZF
set rtp+=~/.fzf
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set autoindent
set smartindent

set autoread
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set relativenumber
set number
set numberwidth=3

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
" set diffopt+=vertical

" Copy to clipboard
set clipboard=unnamed

set lazyredraw
set termguicolors

set background=dark

colorscheme dracula

filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif


" Go file config
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au BufRead,BufNewFile .eslintrc.json setlocal filetype=json
au BufRead,BufNewFile .babelrc setlocal filetype=json
au BufRead,BufNewFile .prettierrc setlocal filetype=json

au BufRead,BufNewFile .babelrc.js setlocal filetype=javascript
au BufRead,BufNewFile .sequelizerc setlocal filetype=javascript
au BufRead,BufNewFile *.hbs setlocal filetype=html


" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1


augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Try to make vertical bar transparent
hi VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE