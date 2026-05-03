-- lsp 支持

local M = {
    "williamboman/mason.nvim",
    event = "BufReadPost",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
        { "neovim/nvim-lspconfig" },
    },
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = {
            "lua_ls",
        },
    }

    -- Setup LSP
    require("lspconfig").lua_ls.setup {}
    require("lspconfig").rust_analyzer.setup {
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    allTargets = false
                },
            },
        },
    }
    require("lspconfig").gopls.setup {
        settings = {
            -- INFO: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            codelenses       = {
                generate = false,  -- Don't show the `go generate` lens.
                gc_details = true, -- Show a code lens toggling the display of gc's choices.
            },
            diagnosticsDelay = "250ms",
        },
    }
    require("lspconfig").marksman.setup {}
    require("lspconfig").jsonls.setup {}
    require("lspconfig").taplo.setup {}
    require("lspconfig").nimls.setup {}
end

return M
