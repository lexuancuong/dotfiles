call plug#begin('~/.vim/bundle')

" Appearance and themes
" Plug 'itchyny/lightline.vim' " Status line customisation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' " Mark file if it changed
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Autocompletion, formatting, linting & intellisense
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " IDE-like features
" Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' } -- Use it later
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer'} 
Plug 'SirVer/ultisnips' " Snippets

" File fuzzy searching
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utilities
Plug 'tpope/vim-surround' " Mappings for surroundings like brackets, quotes, e.t.c.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'airblade/vim-gitgutter' " Shows a git diff in the sign column
Plug 'tpope/vim-fugitive' " Like vim-gitgutter and support it.
Plug 'scrooloose/nerdcommenter' " For easily commenting. multi types of file: .py, .js,... 
Plug 'easymotion/vim-easymotion' " For quickly motion in Vim. Such as searching by AG,...
Plug 'sheerun/vim-polyglot' " Adding Plug for new languges support
Plug 'ervandew/supertab' " Use <Tab> for autocompletion in insert mode
Plug 'mattn/emmet-vim' " Makes writing HTML and CSS much easier
Plug 'luochen1990/rainbow' " Use different colours for parenthesis levels
Plug 'ekalinin/dockerfile.vim' " For DOckerfile
Plug 'christoomey/vim-tmux-navigator' " Move between panes
Plug 'prettier/vim-prettier'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" Local config
if filereadable($HOME . "/.vimrc.bundles.local")
  source ~/.vimrc.bundles.local
endif
