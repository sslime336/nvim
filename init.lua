local _ = require('basic')   -- 基础配置，如复用系统剪切板等
local _ = require('keymaps') -- 键位映射
local platform = require("platform")

-- 默认日志位置: ~/.local/share/nvim/*.log
local log = require("log")

-- macos 上是 ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { result,                         "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        log.error("failed to git clone https://github.com/folke/lazy.nvim.git: " .. result)
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    change_detection = {
        enabled = false, -- 自动检查配置文件更新
        notify = false,  -- 当配置文件发生更改时发送通知
    },
    spec = {
        -- { import = 'plugins' },
        -- { import = 'plugins.git' },
        -- { import = 'plugins.languages' },
        -- { import = 'plugins.lsp' },
        -- { import = 'plugins.themes' },
        -- { import = 'plugins.ui' },
        -- { import = 'plugins.utils' },
        -- { import = 'plugins.view' },
    },
})
