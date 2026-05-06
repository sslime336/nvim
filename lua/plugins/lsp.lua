-- lsp

vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

-- 优化lsp使用体验
vim.pack.add {
    "https://github.com/nvimdev/lspsaga.nvim",
}
require("lspsaga").setup(
    {
        finder = {
            keys = {
                toggle_or_open = '<CR>'
            }
        },
        lightbulb = {
            sign     = false,
            debounce = 12,
        },
    }
)
local opt = {
    silent = true, noremap = true
}
-- 在悬浮窗查看定义
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
-- 跳转到定义
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>:set nu rnu<CR>", opt)
-- 显示注释文档，Ctrl-K 跳入文档
vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga hover_doc<CR>", opt)
-- 跳转到实现
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
-- 重命名
vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opt)
-- 显示错误信息
vim.keymap.set("n", "<space>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
vim.keymap.set("n", "<space>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opt) -- 当前 Workspace 的诊断信息
-- 跳转到上一个错误
vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
-- 跳转到下一个错误
vim.keymap.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
-- Finder(可对应 Lsp 中的 Reference)
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opt)
-- Code Action
vim.keymap.set("n", "<space>j", "<cmd>Lspsaga code_action<CR>", opt)
vim.keymap.set("v", "<space>j", "<cmd>Lspsaga code_action<CR>", opt)

-- 添加后缀类型提示
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- 检查服务器是否支持 inlay hints
        if client and client.server_capabilities.inlayHintProvider then
            -- 映射 <leader>th 来切换 inlay hints
            vim.keymap.set('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end, { buffer = bufnr, desc = 'Toggle Inlay Hints' })

            -- (可选) 默认启用 inlay hints
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})
