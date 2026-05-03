-- 弹出式消息通知栏

local M = {
    'rcarriga/nvim-notify'
}

M.config = function()
    vim.notify = require("notify")
end

return M
