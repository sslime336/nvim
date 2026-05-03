-- 好用的内部终端

return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<C-\\>" },
    },
    config = function()
        require('toggleterm').setup {
            -- 终端打开的大小
            size = function(term)
                if term.direction == "horizontal" then
                    return 25
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            -- 打开关闭终端的快捷键
            open_mapping = '<C-\\>',
            -- 进入终端自动进入 INSERT 模式
            start_in_insert = true,
            -- 打开终端的位置
            -- 2<C-\>: 打开第二个终端，这种写法不支持 tab 和 float
            direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
        }

        -- 在弹出的终端中也能使用 vim 下的快捷键，但只能在 INSERT 模式下编辑，
        -- NORMAL 模式只能复制移动，没有编辑权限
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
