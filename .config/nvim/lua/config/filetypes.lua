vim.api.nvim_create_autocmd('Filetype', {
    pattern = {
		'xml',
		'html',
		'xhtml',
		'css',
		'scss',
		'javascript',
		'typescript',
		'lua',
		'jsx',
		'tsx',
		'typescriptreact',
		'javascriptreact',
		'htmldjango'
	},
    command = 'setlocal shiftwidth=4 tabstop=4 expandtab'
})
vim.api.nvim_create_autocmd('Filetype', {
    pattern = { 'yaml',
	},
    command = 'setlocal shiftwidth=2 tabstop=2 expandtab'
})
