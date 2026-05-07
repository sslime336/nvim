-- buffer包装成tab

vim.pack.add {
    'https://github.com/akinsho/bufferline.nvim'
}
require("bufferline").setup {}
vim.keymap.set('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>')
