" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Start Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'jlanzarotta/bufexplorer'
Plug 'bling/vim-bufferline'
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'
Plug 'mileszs/ack.vim'
Plug 'jnurmine/Zenburn'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'sakhnik/nvim-gdb', { 'do': './install.sh' }
call plug#end()
" End Plugins

" Theme Start
colorscheme zenburn
set laststatus=2 "grey status bar on bottom
set t_Co=256 " 256 Color Term
set cc=80  " Show the line at 80ch
"" Theme End

"" Config Stuff Start
set nocompatible " be iMproved
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set autoread " automatically reload file on changes
set smartcase "smart case searches, defaults to ic, if has caps, use it
set incsearch "incremental search
set tabstop=4 "tabs set to 4 spaces
set shiftwidth=4 "indents also 4 spaces
set shiftround "indent rount to next shiftwidth
set noexpandtab "dont change all new tabs to spaces
set backspace=indent,eol,start "smart-er backspaces
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
set wildmenu " visual autocomplete for command menu
set tags=./tags;/
filetype plugin on
" w!! to save as root
cmap w!! w !sudo tee % >/dev/null
" caps are hard
:command WQ wq
:command Wq wq
:command W w
:command Q q
"" Config Stuff End

" Rainbow Parens
autocmd VimEnter * RainbowParentheses
" Rainbow Parens

"" Tagbar Start
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" Tagbar end

" Airline
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
" Airline

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Easymotion

" CtrlP
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" CtrlP

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Ack.vim

" Deoplete
set noshowmode
let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=longest,menuone,preview
set hidden
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/Users/jeff/.config/nvim/settings.json'
let g:LanguageClient_serverCommands = {
	\ 'ruby': [ 'solargraph',  'stdio' ],
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ }
" Deoplete
nnoremap <silent> <leader>xh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>xd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>xx :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>xr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>xf :call LanguageClient#textDocument_formatting()<CR>

" maximizer
nnoremap <silent><C-w>z :MaximizerToggle<CR>
vnoremap <silent><C-w>z :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>
