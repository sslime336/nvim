-- 用于按键提示，避免遗忘

vim.pack.add {
    { src = 'https://github.com/folke/which-key.nvim' },
}
local wk = require('which-key')
-- <leader>: ';'
-- TODO: 后续使用工具方法直接映射，不用在统一写在这里了
wk.add({
    {
        "<space>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
    },
    { "<leader>b", desc = "开启标签页跳转选择" },
    { "<C-\\>", desc = "打开终端" },
    { '<leader>F', desc = '向前查找' },
    { '<leader>f', desc = '向后查找' },
    { '<space>b', desc = '打开文件列表' },

    { '<space>b', desc = '打开文件列表' },

    { '<space>g', desc = '使用 rg(ripgrep) 在当前路径查找匹配的文件及其内容' },
    { '<space>f', desc = '在当前路径查找匹配的文件' },
    -- { '<space>p', desc = '查找历史 projects' },
    -- { '<space>b', desc = '在当前 buffer 中查找' },
    -- { '<space>m', desc = '查找书签' },
    -- { '<leader>b', desc = '开启标签页跳转选择' },
    -- { '<leader>B', desc = '关闭标签页跳转选择' },

    -- Git

    -- `<leader>ga`: git add
    -- `<leader>gr`: undo git add
    -- `<leader>gu`: 恢复到更改前的样子
    -- `<leader>gi`: 在原文本中查看变化
    -- `<leader>gv`: 在弹出的小窗口中查看变化(ps: 感觉不如上一个快捷键展示效果好)

    -- 内嵌终端

    --  `<C-\>`: 打开关闭
    --  `2<C-\>`: 打开关闭第二个，其他以此类推 `x<C-\>`，可以在已经打开第一个后使用
    --  `<C-[>` 在终端进入普通模式，然后再敲 `2<C-\>`
    --  打开第二个终端(一般会在第一个的右边打开)

})
