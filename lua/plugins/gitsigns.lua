-- git集成

vim.pack.add {
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

local opt = {
    silent = true, noremap = true,
}
vim.keymap.set('n', '<leader>gv', ':Gitsigns preview_hunk<CR>', opt)
vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk_inline<CR>', opt)
vim.keymap.set('n', '<leader>gn', ':Gitsigns prev_hunk<CR>', opt)
vim.keymap.set('n', '<leader>gp', ':Gitsigns next_hunk<CR>', opt)
vim.keymap.set('n', '<leader>ga', ':Gitsigns stage_hunk<CR>', opt)
vim.keymap.set('n', '<leader>gr', ':Gitsigns undo_stage_hunk<CR>', opt)
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', opt)
