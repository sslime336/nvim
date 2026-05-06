-- 文件树

vim.pack.add({
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3')
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})
require('neo-tree').setup {
    filesystem = {
        filtered_items = {
            visible = true,          -- 确保过滤项目可见
            hide_dotfiles = false,   -- 显示以点开头的文件
            hide_gitignored = false, -- 显示被 Git 忽略的文件
        },
        follow_current_file = {
            enabled = true,    -- 启用自动跟随功能（核心配置）
            leave_dirs_open = false, -- 可选：设置为 true 可保持中途目录展开，false 则只展开到文件所在父级
        },
    }
}
vim.keymap.set("n", "<space>b", "<cmd>Neotree toggle<CR>", {
    silent = true, noremap = true
})
