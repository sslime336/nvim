-- 右侧滚动条

local M = {
    'petertriho/nvim-scrollbar',
    event = { "BufReadPost" },
}

M.config = function()
    require("scrollbar").setup()
end

return M
