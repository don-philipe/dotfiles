require("config.remap")
require("config.set")

-- plugin manager
require("config.lazy")

-- plugins
require("config.cmp")
require("config.gen-private")
require("config.lsp")
require("config.mason")
require("config.treesitter")
require("config.gitsigns")
require("config.lualine")

-- for some reason this must be placed in init.lua file
-- it doesn't work in any lua/config/*.lua files
require('lspconfig').pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120,
                },
            },
        },
    },
}
