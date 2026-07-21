return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                -- "gopls",
                "clangd",
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        cmd = {
                            "clangd",
                            "--query-driver=/home/crp/distrobox/cdc/sdk/yocto/sysroots/x86_64-oesdk-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-g++",
                            -- "--query-driver=/opt/iveco-qnx-sdk-2026.03.2/host/linux/x86_64/usr/bin/aarch64-unknown-nto-qnx7.1.0-g++"
                        },
                    })
                end,
            }
        })
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
            mapping = {
                ["<C-space>"] = cmp.mapping.confirm({ select = true }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
            },
        })

        -- Workaround: https://github.com/neovim/neovim/issues/30985
        for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
            local default_diagnostic_handler = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, result, context, config)
                if err ~= nil and (err.code == -32603 or err.code == -32802) then
                    return
                end
                return default_diagnostic_handler(err, result, context, config)
            end
        end
    end
}
