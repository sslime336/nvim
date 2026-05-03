-- 像编辑 buffer 一样编辑文件夹和文件

local M = {
    'stevearc/oil.nvim',
    event = { "VeryLazy" },
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
    require("oil").setup()
    vim.keymap.set("n", "<leader>o", require("oil").toggle_float, { silent = true, noremap = true })
end

return M
