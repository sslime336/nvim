-- 状态栏

vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})
require 'nvim-web-devicons'.setup()
require('lualine').setup {
    options = {
        theme = 'onedark',
    },
}
