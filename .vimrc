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