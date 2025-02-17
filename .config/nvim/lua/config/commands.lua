vim.api.nvim_create_user_command('JQ', function()
	vim.cmd('%!jq .')
end, {})
