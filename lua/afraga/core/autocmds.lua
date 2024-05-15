local function setup_autocmds()
	vim.cmd([[ au BufRead,BufNewFile *.templ set filetype=templ ]])
end

return {
	setup_autocmds = setup_autocmds,
}
