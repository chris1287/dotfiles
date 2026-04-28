return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "c", "cpp", "lua", "rust", "bash", "markdown", "python"
            },
        })
    end
}
