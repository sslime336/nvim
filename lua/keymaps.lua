-- 插件无关的键位映射

local opt = {
    noremap = true,
    silent = true,
}
-- 在命令模式粘贴需要设置 silent 为 false 结果才能直接显示出来
local opt2 = {
    noremap = true,
    silent = false,
}

_Ctrl_s = function()
    -- local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    -- if ft == 'go' then
    --     vim.cmd [[GoImport]]
    --     vim.cmd [[GoFmt]]
    -- end
    vim.lsp.buf.format { async = true };
    vim.cmd('w')
    vim.cmd('set nu rnu')
    vim.cmd('Trim')
end

-- 格式化、保存当前文件
vim.keymap.set('n', '<C-s>', ':lua _Ctrl_s()<CR>', opt)

-- 命令/插入模式下 Ctrl-v 能粘贴
vim.keymap.set('i', '<C-v>', '<Esc>pa', opt)
vim.keymap.set('c', '<C-v>', '<C-r>"', opt2)

-- 设置分屏大小 Ctrl + 上下左右
vim.keymap.set('n', '<C-Up>', '<C-w>+', opt)
vim.keymap.set('n', '<C-Down>', '<C-w>-', opt)
vim.keymap.set('n', '<C-Left>', '<C-w><', opt)
vim.keymap.set('n', '<C-Right>', '<C-w>>', opt)
