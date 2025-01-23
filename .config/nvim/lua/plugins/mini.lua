-- plugins form the "mini" plugin set https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules 
return {
    -- auto-insert closing brackets etc.
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',  -- lazy loading (when entering insert mode)
        config = true,  -- shorthand for calling plugins setup function
    },
}
