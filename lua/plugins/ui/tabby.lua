-- 管理 tabs

local M = {
    'nanozuki/tabby.nvim',
}

M.config = function()
    local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
    }
    require('tabby.tabline').set(function(line)
        return {
            {
                { '  ', hl = theme.head },
                line.sep('|', theme.win, theme.fill),
                -- line.sep('', theme.head, theme.fill),
            },
            line.tabs().foreach(function(tab)
                local hl = tab.is_current() and theme.current_tab or theme.tab
                return {
                    -- line.sep('', hl, theme.fill),
                    line.sep('|', theme.win, theme.fill),
                    tab.is_current() and '' or '󰆣',
                    tab.number(),
                    tab.name(),
                    tab.close_btn(''),
                    -- line.sep('', hl, theme.fill),
                    line.sep('|', theme.win, theme.fill),
                    hl = hl,
                    margin = ' ',
                }
            end),
            line.spacer(),
            line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                return {
                    -- line.sep('', theme.win, theme.fill),
                    line.sep('|', theme.win, theme.fill),
                    win.is_current() and '' or '',
                    win.buf_name(),
                    -- line.sep('', theme.win, theme.fill),
                    line.sep('|', theme.win, theme.fill),
                    hl = theme.win,
                    margin = ' ',
                }
            end),
            {
                -- line.sep('', theme.tail, theme.fill),
                { '  ', hl = theme.tail },
            },
            hl = theme.fill,
        }
    end)
    local opt = { noremap = true, silent = true }
    vim.opt.showtabline = 2 -- 总是显示标签页
    vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", opt)
    vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", opt)
    vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", opt)
    vim.api.nvim_set_keymap("n", "<C-l>", ":tabn<CR>", opt)
    vim.api.nvim_set_keymap("n", "<C-h>", ":tabp<CR>", opt)
    -- move current tab to previous position
    vim.api.nvim_set_keymap("n", "<M-h>", ":-tabmove<CR>", opt)
    -- move current tab to next position
    vim.api.nvim_set_keymap("n", "<M-l>", ":+tabmove<CR>", opt)
end

return M
