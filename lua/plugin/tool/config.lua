local config = {}

config.fzf = function ()
    require('plugin.keymap.keymap').fzf()
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
