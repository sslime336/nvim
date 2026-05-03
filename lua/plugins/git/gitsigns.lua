-- 显示 git 的修改和 blame，git add，恢复成未提交的样子等

return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup {
            signs                        = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm                         = {
                enable = false
            },
        }
        require("scrollbar.handlers.gitsigns").setup()

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
    end
}
