-- 代码补全

return {
    {
        'hrsh7th/nvim-cmp',
        event = "VeryLazy",
        dependencies = {
            -- 各种场景的自动补全
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },
            -- lspkind 提供 VSCode 样式的代码补全 ui(函数，接口等的 ui)
            { 'onsails/lspkind-nvim' },
        },
        config = function()
            local cmp = require('cmp')
            -- 使用 VSCode 的标识符 ui
            local lspkind = require('lspkind')

            local source_mapping = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
            }

            cmp.setup {
                formatting = {
                    format = function(entry, vim_item)
                        -- 使用 lspkind
                        vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
                        vim_item.menu = source_mapping[entry.source.name]
                        if entry.source.name == "cmp_tabnine" then
                            local detail = (entry.completion_item.labelDetails or {}).detail
                            vim_item.kind = ""
                            if detail and detail:find('.*%%.*') then
                                vim_item.kind = vim_item.kind .. ' ' .. detail
                            end

                            if (entry.completion_item.data or {}).multiline then
                                vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                            end
                        end
                        local maxwidth = 80
                        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                        return vim_item
                    end,
                },
                experimental = {
                    -- 是否在当前光标后面虚化显示可补全的内容
                    ghost_text = true,
                },
                snippet = {
                    -- [必须] 指定一个 snippet 引擎
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    -- 给可补全内容外面加上边框
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    -- { 'i', 'c' } 表示可在 INSERT 和 COMMAND 模式使用
                    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
                    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-1),
                    ['<C-f>'] = cmp.mapping.scroll_docs(1),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Accept currently selected item. Set `select` to `false` to only
                    -- confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'cmp_tabnine' },
                    { name = 'vsnip' }, -- For vsnip users.
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = "crates" }, -- crates 补全
                }
            }

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = {
                    -- You can specify the `git` source if [you were installed
                    -- it](https://github.com/petertriho/cmp-git).
                    { name = 'git' },
                    { name = 'buffer' },
                }
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                    { name = 'path' },
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'path' },
                    { name = 'cmdline' },
                }
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
            -- require('lspconfig')['gopls'].setup { capabilities = capabilities }
        end
    },
}
