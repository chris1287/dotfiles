-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     config = function()
--         require('catppuccin').setup({
--             flavour = "mocha",
--             transparent_background = false,
--         });
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }

-- return {
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     config = function()
--         require("kanagawa").setup({
--
--         });
--         vim.cmd.colorscheme "kanagawa"
--     end
-- }

-- return {
--     "mcauley-penney/techbase.nvim",
--     name = "techbase",
--     config = function()
--         vim.cmd.colorscheme "techbase"
--     end
-- }

return {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function()
        require('tokyonight').setup({
            style = "night",
        });
        vim.cmd.colorscheme "tokyonight"
    end
}
