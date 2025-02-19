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
	      https = vars["https"],
	      show_prompt = true,
	      debug = false,

	      -- https://github.com/David-Kunz/gen.nvim/issues/116
	      command = function(options)
		      local body = { model = options.model, stream = true }
		      local schema = "http"
		      if options.https then
			      schema = "https"
		      end
		      return "curl --silent --no-buffer -X POST " .. schema .. "://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
              end,
      }},
}
