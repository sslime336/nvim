return {
    -- rust-tools for using rust-analyzer
    {
        'simrat39/rust-tools.nvim',
        ft = "rs",
        dependencies = { { 'neovim/nvim-lspconfig' } },
        config = function()
            require("rust-tools").setup({
                server = {
                    on_attach = function(_, bufnr)
                    end,
                },
            })
        end
    },
    -- Rust Cargo.toml 提示
    {
        'saecki/crates.nvim',
        ft = "toml",
        tag = 'v0.3.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
}
