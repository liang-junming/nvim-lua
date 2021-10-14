local config = {}

config.telescop = function ()
    local layout_height = 12
    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔍 ',
            selection_caret = '● ',
            entry_prefix = '  ',
            layout_config = {
                bottom_pane = {
                    height = 20,
                    prompt_position = "top"
                },
                center = {
                    height = 0.5,
                    preview_cutoff = 40,
                    prompt_position = "bottom",
                    width = 0.5
                },
                cursor = {
                    height = 0.5,
                    preview_cutoff = 40,
                    width = 0.5
                },
                horizontal = {
                    height = 0.5,
                    preview_cutoff = 120,
                    prompt_position = "bottom",
                    width = 0.8
                },
                vertical = {
                    height = 0.5,
                    preview_cutoff = 40,
                    prompt_position = "bottom",
                    width = 0.5
                }
            }
        },
        pickers = {
            find_files = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_files = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            grep_string = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            live_grep = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            file_browser = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            buffers = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            oldfiles = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            commands = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            tags = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            command_history = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            search_history = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            help_tags = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            man_pages = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            marks = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            colorscheme = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            quickfix = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            loclist = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            jumplist = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            vim_options = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            registers = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            autocommands = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            spell_suggest = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            keymaps = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            filetypes = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            highlights = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            current_buffer_fuzzy_find = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            current_buffer_tags = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            resume = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            pickers = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_references = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_document_symbols = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_workspace_symbols = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_dynamic_workspace_symbols = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_code_actions = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_range_code_actions = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_document_diagnostics = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_workspace_diagnostics = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_implementations = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_definitions = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            lsp_type_definitions = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_commits = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_bcommits = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_branches = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_status = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            git_stash = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            treesitter = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            planets = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            builtin = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            reloader = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
            symbols = {
                theme = 'ivy',
                layout_config = {
                    height = layout_height
                }
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    require('telescope').load_extension('project')
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('vim_bookmarks')
end

config.bookmark = function ()
    vim.g.bookmark_no_default_key_mappings = 1
    require('plugin.keymap.keymap').bookmark()
end

config.which_key = function ()
    local wk = require('which-key')
    wk.setup {
        icons = {
            breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
            separator = '➜', -- symbol used between a key and it's label
            group = ' ', -- symbol prepended to a group
        }
    }

    require('plugin.keymap.keymap').premap()
end

config.wilder = function ()
    vim.cmd [[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)

call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])

call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
]]
end

config.lastplace = function ()
    require'nvim-lastplace'.setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
    }
end

config.interestingwords = function ()
    vim.api.nvim_set_keymap('n', 'n', '<cmd>call WordNavigation(0)<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'N', '<cmd>call WordNavigation(1)<cr>', { noremap = true })
    require('plugin.keymap.keymap').interestingwords()
end

function config.neogit ()
    require('neogit').setup({
        disable_signs = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        auto_refresh = true,
        disable_builtin_notifications = false,
        commit_popup = {
            kind = "vsplit",
        },
        -- customize displayed signs
        signs = {
            -- { CLOSED, OPENED }
            section = { ">", "v" },
            item = { ">", "v" },
            hunk = { "", "" },
        },
        integrations = {
            -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
            -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
            --
            -- Requires you to have `sindrets/diffview.nvim` installed.
            diffview = true
        },
        -- override/add mappings
        mappings = {
            -- modify status buffer mappings
            status = {
                ['1'] = 'Depth1', -- Set foldlevel to 1
                ['2'] = 'Depth2', -- Set foldlevel to 2
                ['3'] = 'Depth3', -- Set foldlevel to 3
                ['4'] = 'Depth4', -- Set foldlevel to 4
                ['c'] = 'CommitPopup',
                ['L'] = 'LogPopup',
                ['Z'] = 'StashPopup',
                ['b'] = 'BranchPopup',
                ['p'] = 'PullPopup',
                ['P'] = 'PushPopup',
                ['o'] = 'Toggle',
                ['x'] = 'Discard',
                ['s'] = 'Stage',
                ['S'] = 'StageUnstaged',
                ['<C-s>'] = 'StageAll',
                ['<Enter>'] = 'GoToFile',
                ['u'] = 'Unstage',
                ['U'] = 'UnstageStaged',
                ['<C-r>'] = 'RefreshBuffer',
                ['$'] = 'CommandHistory',
                ['?'] = 'HelpPopup',
            }
        }
    })

    -- Notification Highlighting
    vim.cmd [[ hi NeogitNotificationInfo guifg=#80ff95 ]]
    vim.cmd [[ hi NeogitNotificationWarning guifg=#fff454 ]]
    vim.cmd [[ hi NeogitNotificationError guifg=#c44323 ]]

    -- Contextual Highlighting
    vim.cmd [[ hi def NeogitDiffAddHighlight guibg=#404040 guifg=#859900 ]]
    vim.cmd [[ hi def NeogitDiffDeleteHighlight guibg=#404040 guifg=#dc322f ]]
    vim.cmd [[ hi def NeogitDiffContextHighlight guibg=#333333 guifg=#b2b2b2 ]]
    vim.cmd [[ hi def NeogitHunkHeader guifg=#cccccc guibg=#404040 ]]
    vim.cmd [[ hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d ]]
end

return config
