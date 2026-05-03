local M = {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    lazy = false,
    priority = 1000
}

M.config = function()
    vim.cmd("colorscheme onedark")
end

return M
