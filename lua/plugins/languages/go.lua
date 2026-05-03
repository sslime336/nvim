-- A feature-rich Go development plugin, leveraging gopls, treesitter AST,
-- Dap, and various Go tools to enhance the development experience.

local M = {
    "ray-x/go.nvim",
    ft = { "go", 'gomod', 'gowork' },
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    build = ':lua require("go.install").update_all_sync()',
}

M.config = function()
    local capabilities = require('cmp_nvim_lsp')
        .default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('go').setup {
        lsp_cfg = {
            capabilities = capabilities,
        },
        lsp_keymaps = false,
    }
end

return M
