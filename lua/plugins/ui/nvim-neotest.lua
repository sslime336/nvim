local M = {
    "nvim-neotest/neotest",
    enabled = false,
    dependencies = {
        "rouge8/neotest-rust",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim"
    }
}

M.config = function()
    require("neotest").setup({
        adapters = {
            require("neotest-rust")
        }
    })
end

return M
