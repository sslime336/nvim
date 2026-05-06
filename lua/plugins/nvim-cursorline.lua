-- 高亮光标所在单词的同名变量

vim.pack.add {
    { src = 'https://github.com/yamatsum/nvim-cursorline' },
}

require('nvim-cursorline').setup({
    cursorline = {
        enable = false,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
})
