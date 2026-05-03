-- 使用系统剪切板
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- 是否启用鼠标，不启用可以设置为空字符串: ''
vim.o.mouse = 'a'

-- <leader>
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- 启用行号和相对行号
vim.o.number = true
vim.o.relativenumber = false

-- 这个会高亮当前行(在原版状态下当前行会有一个下划线)
vim.o.cursorline = false

-- tab 相关配置
vim.o.shiftwidth = 4   -- 按下 tab 4 格宽
vim.o.tabstop = 4      -- 一个 tab 会被显示成 4 个空格
vim.o.softtabstop = 4
vim.o.shiftwidth = 4   -- 每个 tab 会插入 4 个空格
vim.o.expandtab = true -- 将 tabs 换成 spaces

-- 不生成备份文件，如 *.swp
vim.o.backup = false

-- 关闭搜索高亮
vim.o.hlsearch = false
