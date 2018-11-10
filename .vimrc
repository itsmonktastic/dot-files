call plug#begin()
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
Plug 'kana/vim-tabpagecd'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jnurmine/Zenburn'
"Plug 'mhinz/vim-grepper' " vim 8
call plug#end()

colorscheme zenburn

autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2
autocmd BufNewFile,BufRead *.rb set expandtab

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

let maplocalleader = ","
noremap <LocalLeader>d :NERDTreeToggle<CR>
noremap <LocalLeader>b :CtrlPBuffer<CR>
"noremap <LocalLeader>f :CtrlPCurWD<CR>
noremap <LocalLeader>f :NERDTreeFind<CR>

" hide the menu bar (gvim)
set guioptions -=m
" hide the toolbar (gvim)
set guioptions -=T

" set y/p to copy/paste into both of X11's CLIPBOARD selections - use
" clipboard manager to sync X11 buffers
set clipboard+=unnamedplus
