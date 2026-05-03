-- Nordfox

local M = {
    "EdenEast/nightfox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.cmd [[colorscheme nordfox]]
    require('nightfox').setup({
        options = {
            styles = {
                comments     = "none",
                conditionals = "none",
                constants    = "none",
                functions    = "none",
                keywords     = "none",
                numbers      = "none",
                operators    = "none",
                strings      = "none",
                types        = "none",
                variables    = "none",
            }
        }
    })
end

return M
