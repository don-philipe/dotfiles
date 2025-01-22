-- Custom remappings

-- paste buffer and dont replace buffer content with what has been pasted over (but put it to "void" buffer)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- tab creation, navigation and closing 
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-x>", ":tabclose<CR>")

-- resize windows with arrow keys
vim.keymap.set("n", "<Up>", ":resize -1<CR>")
vim.keymap.set("n", "<Down>", ":resize +1<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +1<CR>")
