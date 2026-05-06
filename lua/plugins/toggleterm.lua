-- 方便的终端操作

-- 加载插件
vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })

-- 基础配置
require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 25
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = nil,     -- 禁用默认映射
    start_in_insert = true, -- 仅对新终端有效
    direction = 'horizontal',
})

-- 加载正确的 API
local Terminal = require('toggleterm.terminal').Terminal

-- 获取第一个普通终端（非浮动）
local function get_first_terminal()
    local all_terminals = require('toggleterm.terminal').get_all(false)
    for _, term in ipairs(all_terminals) do
        if term.direction ~= "float" then
            return term
        end
    end
    return nil
end

-- 核心逻辑：有则聚焦并进入插入模式，无则新建
local function smart_terminal_toggle()
    local term = get_first_terminal()
    if not term then
        -- 没有终端 → 新建并打开
        term = Terminal:new({ direction = "horizontal" })
        term:toggle()
        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 10)
        return
    end

    if not term:is_open() then
        -- 终端存在但窗口已关闭 → 打开窗口
        term:open()
        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 10)
        return
    end

    -- 终端窗口已打开，检查当前焦点是否已在终端窗口内
    local current_win = vim.api.nvim_get_current_win()
    local term_win = term.win_id -- 终端窗口的 ID
    if term_win and current_win == term_win then
        -- 已经聚焦在终端 → 直接进入插入模式
        vim.cmd("startinsert")
    else
        -- 焦点在其他地方 → 先聚焦终端，再进入插入模式
        term:focus()
        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 10)
    end
end

-- 绑定快捷键
vim.keymap.set('n', '<C-\\>', smart_terminal_toggle, { noremap = true, silent = true })
