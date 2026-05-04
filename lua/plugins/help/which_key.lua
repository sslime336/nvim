-- 用于按键提示，避免遗忘

local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    spec = {},
    opts = {
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
        {
            "<leader>b",
            function ()
            end,
            desc = "开启标签页跳转选择"
        },
        {
            "gr",
            function ()
            end,
            desc = "查找引用"
        },
        {
            "<C-\\>",
            function ()
            end,
            desc = "打开终端"
        },
    },
}

return M
