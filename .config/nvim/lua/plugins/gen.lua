local ok, vars = pcall(require, 'config.gen-private')
if not ok then
  print("Missing gen-private configuration file.")
end

return {
    { "David-Kunz/gen.nvim",
      opts = {
	      model = vars["model"],
	      host = vars["host"],
	      port = vars["port"],
      }},
}
