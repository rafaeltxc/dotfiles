-- Utility function to create user commands
local function create_user_command(name, fn, opts)
	vim.api.nvim_create_user_command(name, fn, opts)
end

-- Number of matches per search
create_user_command("Match", function(opts)
	local cmd = "%s/" .. opts.args .. "//gn"
	local success, err = pcall(function()
		return vim.cmd(cmd)
	end)

	if not success then
		print("0 matches")
	end
end, { nargs = 1 })

-- Local variable to store the a current word under the cursor
local current_match_id = nil

-- Highlight every word equals to the current word under the cursor
create_user_command("EqualWords", function()
	if current_match_id then
		local success = pcall(vim.fn.matchdelete, current_match_id)
		current_match_id = nil

		if not success then
			pcall(vim.fn.matchdelete, -1)
			return
		end
	end

	local line = vim.fn.getline(".")
	local col = vim.fn.col(".")

	local start_col = col
	local end_col = col

	while start_col > 0 and line:sub(start_col, start_col):match("[%w_]") do
		start_col = start_col - 1
	end

	while end_col <= #line and line:sub(end_col, end_col):match("[%w_]") do
		end_col = end_col + 1
	end

	local word = line:sub(start_col + 1, end_col - 1)

	if word ~= "" then
		current_match_id = vim.fn.matchadd("Search", "\\<" .. word .. "\\>")
	end
end, {})
