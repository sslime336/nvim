-- 文件列表

local M = {
    'nvim-tree/nvim-tree.lua',
    keys = { "\\" },
}

M.config = function()
    require('nvim-tree').setup({
        filters             = {
            git_ignored = false,
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = {},
            exclude = {},
        },
        view                = {
            width = 40,
        },
        renderer            = {
            add_trailing = false,
            group_empty = true,
            highlight_git = true,
            full_name = false,
            highlight_opened_files = "none",
            highlight_modified = "none",
            root_folder_label = ":~:s?$?/..?",
            indent_width = 2,
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                webdev_colors      = true,
                git_placement      = "before",
                modified_placement = "after",
                padding            = " ",
                symlink_arrow      = " ➛ ",
                show               = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                },
                glyphs             = {
                    default  = "",
                    symlink  = "",
                    bookmark = "󰆤",
                    modified = "[+]",
                    folder   = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    -- Status type
                    git      = {
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        renamed   = "󰁕",
                        unmerged  = "",
                        untracked = "",
                        deleted   = "",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            symlink_destination = true,
        },
        sync_root_with_cwd  = false,
        respect_buf_cwd     = false,
        update_focused_file = {
            enable = true,
            update_root = false
        },
        on_attach           = function(bufnr)
            local api = require "nvim-tree.api"
            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end
            -- 默认映射
            api.config.mappings.default_on_attach(bufnr)
            -- 自定义映射
            -- 返回上级目录
            vim.keymap.set('n', '<C-[>', '<C-w>l', opts('Back to Editor'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end,
    })
    -- 打开/关闭
    vim.keymap.set('n', '\\', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
end

return M
