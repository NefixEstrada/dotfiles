"
" vim-plug initialization
"
call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" File manager
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

" Powerline icons
Plug 'powerline/powerline'

" vim-airline (the bottom bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git diff
Plug 'airblade/vim-gitgutter'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'rjohnsondev/vim-compiler-go'

" Themes
Plug 'morhetz/gruvbox'

call plug#end()

"
" Identation configuration
"
set tabstop=2
set shiftwidth=2
set softtabstop=2

"
" General settings
"
" Move the lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"
" Autocompletion
"
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#converter_auto_paren = 1	

"
" Vimfiler (tree explorer)
"
au FileType vimfiler setl nonu
let g:vimfiler_as_default_explorer=1
let g:vimfiler_ignore_pattern=[]
noremap <silent> <C-\> :VimFilerExplorer -toggle -status -no-safe <CR>

"
" vim-airline (the thing that's in the bottom with the icons and stuff)
"
set noshowmode
let g:airline_theme = 'simple'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_tools = 1

"
" Set 256 colors
"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

"
" Visual
"
set number

"
" Themes
"
set background=dark
colorscheme gruvbox

"
" Golang
"
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:golang_cwindow = 0

"
" Autocmd
"
" Open vimfiler when opening nvim and change the main focus to the file opened
au VimEnter * if argc() | VimFilerExplorer -status -no-safe | 2wincmd w | endif

" Close vimfiler when it's the last buffer opened
au BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') | quit | endif
