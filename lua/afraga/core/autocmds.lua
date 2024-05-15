local function setup_autocmds()
	vim.cmd([[ au BufRead,BufNewFile *.templ set filetype=templ ]])
end

vim.api.nvim_create_user_command("ClearCache", function()
	-- package.loaded["ADD_MODULE_NAME_TO_CLEAR"] = nil
	print("Cache cleared")
end, {})

return {
	setup_autocmds = setup_autocmds,
}
