require('gitsigns').setup()
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gm', gitsigns.blame_line, { desc = 'Show git message for current line' })
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis ~ vertical=true<CR>:wincmd w<CR>', { desc = 'Show diff for current line' })
vim.keymap.set('n', '<leader>h', gitsigns.next_hunk, { desc = 'Move to next hunk' })
vim.keymap.set('n', '<leader>H', gitsigns.prev_hunk, { desc = 'Move to previous hunk' })
vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, { desc = 'Preview hunk in popup' })
