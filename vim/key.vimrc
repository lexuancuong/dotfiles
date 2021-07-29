" Leader
nnoremap <SPACE> <Nop>
" let mapleader = " "
let mapleader = "\<Space>"

" Use tab with text block
vmap > >gv
vmap < <gv

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

" Remove highlight
map <C-h> :nohl<CR>


" vsplit
nnoremap <leader>v :vsplit<CR>

" for move the pointer to end of line or begin of line
nnoremap <S-w> $
nnoremap <S-b> 0

" for seamlessly navigate vim splits and tmux panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" if &term == "screen-256color"
"     let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" endif

" for getting out of bracket
inoremap <C-e> <C-o>A
inoremap <C-b> <C-o>a

" creat new line in insert mode
inoremap <C-o> <esc>o

" for paste cursor position
noremap p gp
noremap P gP
noremap gp p
noremap gP P

" keep it always centered
" set so=999
noremap j jzz
noremap k kzz
noremap # #zz
noremap * *zz
noremap `` ``zz
noremap n nzz

xnoremap y y`]
xnoremap <C-y> "+y`]
xnoremap <C-p> "+P`]
nnoremap <C-p> "+P
nnoremap <C-c> gg"+yG``
inoremap jj <Esc>

nnoremap <esc> :noh<Cr><esc>
nnoremap <esc>^[ <esc>^[

" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Map common Ex command mistakes
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
cmap E e

" use Ctrl+c to toggle the search buffer and toggle highlighting off/on
let hlstate=0
nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
