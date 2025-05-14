local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Telescope treesitter picker' })
-- find selected text in visual mode with Ctrl-f via telescope:
vim.keymap.set('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<C-r>0<CR>', default_opts)

-- grep hidden files as well
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

require('telescope').setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.95 }
    },
  },
})
