"
" plugins
"
call plug#begin()
" color schemes
Plug 'jnurmine/Zenburn'

" languages
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'pangloss/vim-javascript'
Plug 'keith/rspec.vim' " better syntax highlighting for rspec
Plug 'elixir-editors/vim-elixir'

" general functionality
Plug 'scrooloose/nerdtree'
Plug 'kana/vim-tabpagecd' " keeps track of CWD per tabpage
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'adelarsq/vim-matchit' " add more jumps for % , including do/end in ruby
Plug 'tpope/vim-fireplace' " clojure
call plug#end()

runtime ftplugin/man.vim

"
" appearance
"
colorscheme zenburn
set nu " show line numbers
set cursorline " highlight current line
set colorcolumn=81,121 " show 80char/120char widths

if has("gui_running")
  set guioptions -=m " hide the menu bar (gvim)
  set guioptions -=T " hide the toolbar (gvim)
else
  " allow transparency
  hi Normal guibg=NONE ctermbg=NONE
end

"
" behaviours
"
set swapfile
set nowritebackup
set noautochdir
let g:ctrlp_custom_ignore = '\v(node_modules|.git|.bundle|tmp)' " don't scan these dirs when opening files
let g:ctrlp_working_path_mode = 'd' " hitting C-P will start fuzzy find relative to the cwd for the tab/window
let g:NERDTreeAutoDeleteBuffer=1 " auto close open buffer if deleting or renaming a file through nerdtree

" set y/p to copy/paste into both of X11's CLIPBOARD selections - use
" clipboard manager to sync X11 buffers
set clipboard+=unnamedplus

"
" shortcut keys
"
let mapleader = ","
noremap <Leader>d :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
noremap <Leader>c :NERDTreeCWD<CR>
noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>t :CtrlP<CR>
noremap <Leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" tab switching shortcuts - got used to these on osx
map <A-}> gt
map <A-{> gT
map <A-t> :tabnew<CR>
map <A-w> :tabclose<CR>

"
" language specific behaviours
"

" usual ruby indentation
autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2
autocmd BufNewFile,BufRead *.rb set expandtab
