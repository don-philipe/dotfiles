" general configuration:
syntax on		" Turn on colors
filetype plugin on	" Enables the ftplugin options
filetype indent on
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

" Statusline
Plug 'vim-airline/vim-airline'

" Git diff in sign column
Plug 'airblade/vim-gitgutter'

call plug#end()


" ,nn will toggle NERDTree on and off
"nmap <LocalLeader>n :NERDTreeToggle<cr>

" special configuration:

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict'
let g:pymode_folding = 0


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
