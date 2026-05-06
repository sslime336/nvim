-- 美化诊断报错信息


-- 在当前行后面显示具体报错(关闭原生报错)
vim.diagnostic.config { virtual_text = false }

vim.pack.add({ 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' })
require("tiny-inline-diagnostic").setup({
    options = {
        multilines = {
            enabled = true,
        },
        show_source = {
            enabled = true,
        },
    },
})
