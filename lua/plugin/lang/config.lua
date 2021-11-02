local config = {}

function config.treesitter ()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {
            'c', 'cpp', 'go', 'javascript', 'typescript', 'json', 'html', 'css', 'lua', 'python'
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            enable = true,              -- false will disable the whole extension
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",

                    -- Or you can define your own textobjects like this
                    ["iF"] = {
                        python = "(function_definition) @function",
                        cpp = "(function_definition) @function",
                        c = "(function_definition) @function",
                        java = "(method_declaration) @function",
                    },
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]b"] = "@block.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[b"] = "@block.outer",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]B"] = "@block.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[B"] = "@block.outer",
                },
            }
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = 'o',
                toggle_hl_groups = 'i',
                toggle_injected_languages = 't',
                toggle_anonymous_nodes = 'a',
                toggle_language_display = 'I',
                focus_language = 'f',
                unfocus_language = 'F',
                update = 'R',
                goto_node = '<cr>',
                show_help = '?',
            },
        },
    }

    require('plugin.keymap.keymap').treesitter()
end

function config.lspconfig ()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
    local function setup_servers()
        require 'lspinstall'.setup()
        local servers = require 'lspinstall'.installed_servers()

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.completion.completionItem.documentationFormat = {
            'markdown', 'plaintext'
        }
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.preselectSupport = true
        capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
        capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
        capabilities.textDocument.completion.completionItem.deprecatedSupport = true
        capabilities.textDocument.completion.completionItem.commitCharactersSupport =
        true
        capabilities.textDocument.completion.completionItem.tagSupport = {
            valueSet = {1}
        }
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {'documentation', 'detail', 'additionalTextEdits'}
        }

        for _, server in pairs(servers) do
            require 'lspconfig'[server].setup{
                capabilities = capabilities,
                on_attach = on_attach
            }
        end
    end

    setup_servers()

    -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
    require 'lspinstall'.post_install_hook = function ()
        setup_servers() -- reload installed servers
        vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
    end
end

function config.lspsaga ()
    require 'lspsaga'.init_lsp_saga({
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
        dianostic_header_icon = '   ',
        code_action_icon = ' ',
        finder_definition_icon = '  ',
        finder_reference_icon = '  ',
        finder_action_keys = {
            open = 'o', vsplit = 'v', split = 's', quit = 'q', scroll_down = '<C-d>', scroll_up = '<C-u>' -- quit can be a table
        },
        definition_preview_icon = '  ',
        -- "single" "double" "round" "plus"
        border_style = 'round'
    })
    require('plugin.keymap.keymap').lspsaga()
end

return config
