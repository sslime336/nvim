-- buffer包装成tab

vim.pack.add {
    'https://github.com/akinsho/bufferline.nvim'
}
require("bufferline").setup {}

local mapper = require('lib.keymapper')
mapper.norenmap('<C-l>', '<cmd>BufferLineCycleNext<CR>', '切换到上一个buffer')
mapper.norenmap('<C-h>', '<cmd>BufferLineCyclePrev<CR>', '切换到下一个buffer')
