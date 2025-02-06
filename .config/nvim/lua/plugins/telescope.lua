return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
	      'nvim-lua/plenary.nvim',
	      'BurntSushi/ripgrep',	-- required for live_grep and grep_string and is the first priority for find_files
	      'nvim-telescope/telescope-fzf-native.nvim',	-- native telescope sorter to significantly improve sorting performance
      }
}
