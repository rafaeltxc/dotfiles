local function get_lua_files(directory, base_path)
    local lua_files = {}
    local files = vim.fn.readdir(directory)

    for _, file in ipairs(files) do
        local full_path = directory .. "/" .. file
        if vim.fn.isdirectory(full_path) == 1 then
        elseif file:match("%.lua$") then
            local module_name = full_path:sub(#base_path + 2):gsub("%.lua$", ""):gsub("/", ".")
            table.insert(lua_files, module_name)
        end
    end

    return lua_files
end

local config_path = vim.fn.stdpath("config") .. "/lua"
local directories_to_scan = {
    -- Order must follow:
    config_path .. "/core",
    config_path .. "/",
    config_path .. "/vim",
}

for _, dir in ipairs(directories_to_scan) do
    for _, module in ipairs(get_lua_files(dir, config_path)) do
        require(module)
    end
end

