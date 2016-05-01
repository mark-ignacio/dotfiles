" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Start Plugins
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/cscope.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
call plug#end()
" End Plugins

" Theme Start
set background=dark
colorscheme solarized
set laststatus=2 "grey status bar on bottom
let g:solarized_contrast="high"
let g:solarized_termcolors=256
set background=dark " dark | light "
set t_Co=256 " 256 Color Term
set cc=80  " Show the line at 80ch
set showmode
"" Theme End

"" Config Stuff Start
set nocompatible " be iMproved
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set smartcase "smart case searches, defaults to ic, if has caps, use it
set incsearch "incremental search
set tabstop=4 "tabs set to 4 spaces
set shiftwidth=4 "indents also 4 spaces
set shiftround "indent rount to next shiftwidth
set noexpandtab "dont change all new tabs to spaces
set backspace=indent,eol,start "smart-er backspaces
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
filetype plugin on
" w!! to save as root
cmap w!! w !sudo tee % >/dev/null
"" Config Stuff End

"" Rainbow Parens Start
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"" Rainbow Parens end

"" Tagbar Start
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" Tagbar end

" cscope start
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>fl :call ToggleLocationList()<CR>
" cscope end

map <C-K> :pyf /home/jeff/clang-format.py<CR>
imap <C-K> <ESC>:pyf /home/jeff/clang-format.py<CR>i

" ruby autocmpl
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" end ruby autocmpl

" Airline
let g:airline_theme='bubblegum'
" Airline
