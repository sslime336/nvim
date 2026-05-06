-- 快速注释

vim.pack.add({ 'https://github.com/sslime336/Comment.nvim' })

require('Comment').setup({
    -- Add a space b/w comment and the line
    padding = true,
    -- Whether the cursor should stay at its position
    sticky = true,
    -- Lines to be ignored while (un)comment
    ignore = nil,
    -- LHS of toggle mappings in NORMAL mode
    toggler = {
        -- Line-comment toggle keymap
        line = '<C-/>',
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = '<C-/>',
    },
    pre_hook = nil,
    post_hook = nil,
})
