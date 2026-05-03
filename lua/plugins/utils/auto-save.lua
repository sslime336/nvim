-- 自动保存

local M = {
    "Pocco81/auto-save.nvim",
    event = { "BufReadPost" },
}

M.config = function()
    require("auto-save").setup {
        -- 一次性保存所有 buffer
        write_all_buffers = true,
    }
end

return M
