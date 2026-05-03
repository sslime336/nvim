-- Session

local M = {
    'jedrzejboczar/possession.nvim',
    cmd = {
        'SessionSave',
        'SessionLoad',
        'SessionRename',
        'SessionClose',
        'SessionDelete',
        'SessionShow',
        'SessionList',
        'SessionMigrate',
    }
}

M.config = function()
    require('possession').setup({
        session_dir = vim.fn.stdpath('data') .. 'session',
        silent = false,
        load_silent = true,
        debug = false,
        logfile = false,
        prompt_no_cr = false,
        autosave = {
            current = true,   -- or fun(name): boolean
            tmp = false,      -- or fun(): boolean
            tmp_name = 'tmp', -- or fun(): string
            on_load = true,
            on_quit = true,
        },
        commands = {
            save = 'SessionSave',
            load = 'SessionLoad',
            rename = 'SessionRename',
            close = 'SessionClose',
            delete = 'SessionDelete',
            show = 'SessionShow',
            list = 'SessionList',
            migrate = 'SessionMigrate',
        },
        hooks = {
            before_save = function(name) return {} end,
            after_save = function(name, user_data, aborted) end,
            before_load = function(name, user_data) return user_data end,
            after_load = function(name, user_data) end,
        },
        plugins = {
            close_windows = {
                hooks = { 'before_save', 'before_load' },
                preserve_layout = true, -- or fun(win): boolean
                match = {
                    floating = true,
                    buftype = {},
                    filetype = {},
                    custom = false, -- or fun(win): boolean
                },
            },
            delete_hidden_buffers = false,
            nvim_tree = true,
            tabby = true,
            dap = true,
            delete_buffers = false,
        },
        telescope = {
            list = {
                default_action = 'load',
                mappings = {
                    save = { n = '<c-x>', i = '<c-x>' },
                    load = { n = '<c-v>', i = '<c-v>' },
                    delete = { n = '<c-t>', i = '<c-t>' },
                    rename = { n = '<c-r>', i = '<c-r>' },
                },
            },
        },

    })
end

return M
