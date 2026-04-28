local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function get_build_dir()
    local current_dir = vim.fn.getcwd()
    local compile_commands_path = nil
    for i = 1, 64 do
        local compile_commands = current_dir .. "/compile_commands.json"
        local file = io.open(compile_commands, "r")
        if file == nil then
            current_dir = current_dir .. "/.."
        else
            compile_commands_path = compile_commands
            io.close(file)
            break
        end
    end
    if compile_commands_path == nil then
        print("compile_commands.json not found")
        return nil
    end
    local h = io.popen("realpath " .. compile_commands_path)
    if h == nil then
        return nil
    end
    local res = h:read("*all")
    h:close()
    local build_dir = string.gsub(res, "compile_commands.json\n", "")
    return build_dir
end

local function pick_and_build()
    local build_dir = get_build_dir()
    if build_dir == nil then
        return
    end
    local opts = require("telescope.themes").get_dropdown({})
    local h = io.popen("cmake  --build " .. build_dir .. " --target help")
    if h == nil then
        return
    end

    local avail_targets = {}
    for line in h:lines() do
        local i, j = string.find(line, "%.%.%. ")
        if i ~= nil then
            line = string.sub(line, j + 1)
            i, j = string.find(line, " ")
            if i ~= nil then
                line = string.sub(line, 1, i - 1)
            end
            table.insert(avail_targets, line)
        end
    end

    opts = opts or {}
    local selected_target = nil
    pickers.new(opts, {
        prompt_title = "Targets",
        finder = finders.new_table{
            results = avail_targets
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    selected_target = vim.inspect(selection[1])
                    -- nvterm.send("cmake --build " .. build_dir .. " --parallel 6 --target " .. selected_target, "horizontal")
                    vim.cmd(":make --build " .. build_dir .. " --parallel 6 --target " .. selected_target)
                end
            end)
            return true
        end
    }):find()
end

M.pick_and_build = pick_and_build

return M

