-- Neovim 版 easymotion
-- 'phaazon/hop.nvim' maintainer 正在找维护者，空行报错 bug 还未修复所以先用 fork

return {
    'sslime336/hop.nvim',
    keys = {
        "<leader>",
    },
    config = function()
        local hop = require('hop')
        local directions = require('hop.hint').HintDirection
        vim.keymap.set('n', '<leader>f',
            function()
                hop.hint_char1(
                    {
                        direction = directions.AFTER_CURSOR,
                        current_line_only = false
                    }
                )
            end, { remap = true })
        vim.keymap.set('n', '<leader>F',
            function()
                hop.hint_char1(
                    {
                        direction = directions.BEFORE_CURSOR,
                        current_line_only = false
                    }
                )
            end, { remap = true })
        hop.setup {}
    end
}
