vim.api.nvim_create_user_command("ClearCache", function()
	-- package.loaded["ADD_MODULE_NAME_TO_CLEAR"] = nil
	print("Cache cleared")
end, {})

vim.api.nvim_create_user_command("GoBuild", function()
	local project_dir = vim.fn.expand("%:p:h")
	local tmp_dir = project_dir .. "/tmp"

	local cmd = 'go build -o "' .. tmp_dir .. "."

	vim.cmd("silent !" .. cmd)
	print("Project built successfully")
end, {})

vim.api.nvim_create_user_command("GoRun", function()
	print("run bin and display output")
	local project_dir = vim.api.nvim_call_function("expand", { "%:p:h" })
	local tmp_dir = vim.api.nvim_call_function("fnamemodify", { project_dir .. "/tmp", ":p" })

	print("PROJ DIR:" .. project_dir, "TMP DIR:" .. tmp_dir)

	local bin = ""
	for line in io.popen("ls -1 " .. tmp_dir):lines() do
		bin = line:match("([^/]+)$")
	end

	print("BIN:" .. bin)
	local cmd = "cd " .. tmp_dir .. " && ./" .. bin
	local output, _ = vim.fn.system("echo; " .. cmd)
	print(output)
end, {})

vim.api.nvim_create_user_command("GoTest", function()
	print("run tests")
	local project_dir = vim.api.nvim_call_function("expand", { "%:p:h" })
	local tmp_dir = vim.api.nvim_call_function("fnamemodify", { project_dir .. "/tmp", ":p" })

	print("PROJ DIR:" .. project_dir, "TMP DIR:" .. tmp_dir)

	local cmd = ":terminal go test"

	vim.cmd("vsplit | terminal")
	vim.cmd(cmd)
end, {})
