-- 报错提示

vim.pack.add {
    { src = 'https://github.com/folke/trouble.nvim' },
    'https://github.com/nvim-treesitter/nvim-treesitter'
}

require('trouble').setup {
    follow = true,
    auto_preview = false,
}
