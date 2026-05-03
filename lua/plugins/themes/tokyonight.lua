-- tokyonight 主题

local M = {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
}

M.config = function()
    require("tokyonight").setup({
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            functions = { italic = false },
            variables = { italic = false },
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark", -- style for sidebars, see below
            floats = "dark",   -- style for floating windows
        },
    })

    -- Theme
    -- vim.cmd [[colorscheme tokyonight-night]]
end

return M
