return {

    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

        local function lsp_status()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
                return 'no LSP'
            end
            local names = {}
            for _, c in ipairs(clients) do
                table.insert(names, c.name)
            end
            return table.concat(names, ', ')
        end

        require('lualine').setup{
            sections = {
                lualine_a = {'filename'},
                lualine_b = {'buffers'},
                lualine_c = {'diagnostics', lsp_status},
                lualine_x = {'filetype', 'branch'},
                lualine_y = {'location'},
                lualine_z = {'progress'},

            }
        }
    end
}
