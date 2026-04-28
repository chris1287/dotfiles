return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        -- model = 'claude-sonnet-4.5',           -- AI model to use
        window = {
            layout = 'float',       -- 'vertical', 'horizontal', 'float'
        },
        auto_insert_mode = false,
    },
    -- keys to toggle copilot chat
    keys = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
    },
}
