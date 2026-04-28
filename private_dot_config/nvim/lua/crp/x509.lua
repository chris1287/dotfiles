local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf    = require "telescope.config".values
local action_state = require "telescope.actions.state"

local M = {}

local function dump_cert(cert_path)
    local handle = io.popen("certo -p " .. cert_path)
    if not handle then
        vim.api.nvim_err_writeln("command failed")
        return
    end
    local result = handle:read("*all")
    handle:close()
    return result
end

local function show_info(info)
    pickers.new({}, {
        results_title = "Certificate Info",
        finder = finders.new_table {
            results = vim.split(info, "\n"),
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<cr>", function()
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.fn.setreg("+", selection[1])
                end
            end)
            return true
        end,
    }):find()
end

function M.show_cert_info()
    local info = dump_cert(vim.fn.expand("%"))
    if info then
        show_info(info)
    else
        vim.api.nvim_err_writeln("Failed to get certificate info")
    end
end

function M.setup()
    vim.api.nvim_create_user_command("ShowCertInfo", M.show_cert_info, {})
end

return M

