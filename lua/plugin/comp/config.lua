local config = {}

function config.nvimcmp ()
    vim.o.completeopt = 'menuone,noselect'
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    cmp.setup({
        formatting = {
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                }
                -- load lspkind icons
                vim_item.kind = string.format("%s %s",
                lspkind_icons[vim_item.kind],
                vim_item.kind)

                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    buffer = "[BUF]",
                    path = "[PATH]",
                    luasnip = "[SNIP]",
                    nvim_lua = "[LUA]",
                })[entry.source.name]

                return vim_item
            end
        },
        snippet = {
            expand = function(args)
                -- For `luasnip` user.
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ["<C-h>"] = function(fallback)
                if require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end,
            ["<C-l>"] = function(fallback)
                if require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                else
                    fallback()
                end
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            -- For luasnip user.
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'buffer' },
        }
    })
end

function config.luasnip()
    require('luasnip').config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
    require("luasnip/loaders/from_vscode").load()
end

function config.autopairs()
    require('nvim-autopairs').setup { fast_wrap = {} }
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true,
        map_complete = true,
        auto_select = true
    })
end

return config
