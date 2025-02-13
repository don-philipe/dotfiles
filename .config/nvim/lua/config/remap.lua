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

-- prompt user for command, run it and put it's output at cursor position
local function run_and_paste()
	local out_raw = vim.fn.system(vim.fn.input('Command: '))
	local out = string.gsub(out_raw, "\n", "")
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { out })
end
vim.keymap.set("n", "<C-c>", run_and_paste)
