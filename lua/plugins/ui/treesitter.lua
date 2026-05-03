-- treesitter 代码高亮

return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost" },
    config = function()
        require 'nvim-treesitter.configs'.setup({
            ensure_installed = {
                "c",
                "lua",
                -- "rust",
                -- "markdown",
                -- "markdown_inline",
            },
            -- Install parsers synchronously(only applied to `ensure_installed`)
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true
            },
        })
    end
}
