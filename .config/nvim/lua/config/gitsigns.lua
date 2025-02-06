require('gitsigns').setup()
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gm', gitsigns.blame_line, { desc = 'Show git message for current line' })
