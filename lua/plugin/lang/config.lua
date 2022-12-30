local config = {}

function config.treesitter ()
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
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
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        -- textobjects = {
        --     select = {
        --         enable = true,
        -- 
        --         -- Automatically jump forward to textobj, similar to targets.vim
        --         lookahead = true,
        -- 
        --         keymaps = {
        --             -- You can use the capture groups defined in textobjects.scm
        --             ["af"] = "@function.outer",
        --             ["if"] = "@function.inner",
        --             ["ac"] = "@class.outer",
        --             ["ic"] = "@class.inner",
        --             ["ab"] = "@block.outer",
        --             ["ib"] = "@block.inner",
        -- 
        --             -- Or you can define your own textobjects like this
        --             ["iF"] = {
        --                 python = "(function_definition) @function",
        --                 cpp = "(function_definition) @function",
        --                 c = "(function_definition) @function",
        --                 java = "(method_declaration) @function",
        --             },
        --         },
        --     },
        --     move = {
        --         enable = true,
        --         set_jumps = true, -- whether to set jumps in the jumplist
        --         goto_next_start = {
        --             ["]f"] = "@function.outer",
        --             ["]c"] = "@class.outer",
        --             ["]b"] = "@block.outer",
        --         },
        --         goto_previous_start = {
        --             ["[f"] = "@function.outer",
        --             ["[c"] = "@class.outer",
        --             ["[b"] = "@block.outer",
        --         },
        --         goto_next_end = {
        --             ["]F"] = "@function.outer",
        --             ["]C"] = "@class.outer",
        --             ["]B"] = "@block.outer",
        --         },
        --         goto_previous_end = {
        --             ["[F"] = "@function.outer",
        --             ["[C"] = "@class.outer",
        --             ["[B"] = "@block.outer",
        --         },
        --     }
        -- },
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

    -- nvim-lsp-installer
    local lsp_installer = require("nvim-lsp-installer")

    -- Register a handler that will be called for all installed servers.
    -- Alternatively, you may also register handlers on specific server instances instead (see example below).
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end)
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
