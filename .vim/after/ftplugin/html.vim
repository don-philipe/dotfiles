setlocal shiftwidth=4
setlocal tabstop=4

" create closing xml tag when typing >
" first write the actual closing bracket (>), then got to normal mode (<Esc>), find
" opening bracket (F<), go one step to the right (l), yank the tag name (yiw),
" find the closing bracket (f>), start appending opening bracket and slash (a</), paste
" yanked word from default register (<C-r>"), add closing bracket (>), leave
" insert mode (<Esc>), go back to opening bracket (F<), enter insert mode (i)
inoremap > ><Esc>F<lyiwf>a</<C-r>"><Esc>F<i
" overwrite automatic angle bracket closing from vimrc to make auto-closing
" tags work properly
inoremap <	<
