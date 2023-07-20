" general configuration:
syntax on		" Turn on colors filetype plugin on	" Enables the ftplugin options filetype indent on
set nocompatible	" turn off vi-compatibility (should be on by default)
set autoindent		" Automaticaly indent while writing
set smarttab
set number
set incsearch
set hlsearch
set nosmartindent
set showcmd
set scrolloff=8
set enc=utf-8
set wrapscan		" start searching at the beginning when EOF reached

" simple appending closing characters automatically
inoremap {		{}<Left>
inoremap {<CR>		{<CR><CR>}<Up>
inoremap {{		{
inoremap {}		{}
inoremap <expr>}	strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap (		()<Left>
inoremap ((		(
inoremap ()		()
" skipping over the closing character:
inoremap <expr>)	strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap [		[]<Left>
inoremap [[		[
inoremap []		[]
inoremap <expr>]	strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <		<><Left>
inoremap <<		<
inoremap <expr>>	strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
"inoremap "		""<Left>
"inoremap '		''<Left>

" Tab navigation
nmap <C-t>	:tabnew<CR>
nmap <C-h>	:tabprev<CR>
nmap <C-l>	:tabnext<CR>

" Resize windows with arrow keys
nmap <Up>	:res -1<CR>
nmap <Down>	:res +1<CR>
nmap <Left>	:vertical res -1<CR>
nmap <Right>	:vertical res +1<CR>

" redefine some default colors
highlight Search ctermfg=Black
highlight Comment ctermfg=012

"
" plugins
" =======

" Use vim-plug as plugin manager
" Autoinstall it when missing:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin config section. Plugins will be installed under ~/.vim/plugged/
call plug#begin()

" Ansible syntax highlighting
Plug 'pearofducks/ansible-vim'

" NERDtree
Plug 'preservim/nerdtree'

" One NERDtree for all tabs
Plug 'jistr/vim-nerdtree-tabs'

" Statusline
Plug 'vim-airline/vim-airline'

" fugitive (git plugin, mainly for statusline)
Plug 'tpope/vim-fugitive'

" Git diff in sign column
Plug 'airblade/vim-gitgutter'

" Latex plugin
Plug 'lervag/vimtex'

" Python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Latex-Suite
Plug 'vim-latex/vim-latex'

" tagalong
" to automatically edit closing HTML tags
" tag names should be changed either in insert mode or via 'cw'
Plug 'AndrewRadev/tagalong.vim'

" vim-css-color
Plug 'ap/vim-css-color'

" Format code with one button press
Plug 'vim-autoformat/vim-autoformat'
" for HTML formatting install tidy package

" Comment stuff out: one line with `gcc`, selection with `gc`
Plug 'tpope/vim-commentary'

call plug#end()


" ,nn will toggle NERDTree on and off
"nmap <LocalLeader>n :NERDTreeToggle<cr>

" special configuration:

" Python
" ======
"
" python-mode configuration (see :help pymode)
let g:pymode_options_max_line_length = 120
"let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict'

" vim-gitgutter
" =============
"
let g:gitgutter_sign_added = '▇▇'
let g:gitgutter_sign_modified = '▇▇'
let g:gitgutter_sign_removed = '▇▇'
highlight GitGutterAdd ctermfg = 2
highlight GitGutterChange ctermfg = 3
highlight GitGutterDelete ctermfg = 1
highlight SignColumn ctermbg=0

" Vala
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m

" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1

" Disable trailing space errors
"let vala_no_trail_space_error = 1

" Disable space-tab-space errors
"let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

" ANTLR4 syntax highlighting
au BufRead,BufNewFile *.g4 set filetype=antlr4
