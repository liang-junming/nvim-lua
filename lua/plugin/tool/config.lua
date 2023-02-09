local config = {}

config.fzf = function ()
    require('plugin.keymap.keymap').fzf()
end

config.bookmark = function ()
    vim.g.bookmark_no_default_key_mappings = 1
    vim.g.bookmark_auto_close = 1
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
end

config.wilder = function ()
    local wilder = require('wilder')
    wilder.setup({modes = {':', '/', '?'}})
    -- Disable Python remote plugin
    wilder.set_option('use_python_remote_plugin', 0)

    wilder.set_option('pipeline', {
        wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 2,
            fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
        )
    })

    local gradient = {
        '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
        '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
        '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
        '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
    }

    for i, fg in ipairs(gradient) do
        gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
    end

    wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = 'rounded',
        max_height = '40%',      -- max height of the palette
        min_height = 0,          -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'bottom', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 1,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        highlights = {
            gradient = gradient, -- must be set
            -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
        },
        highlighter = wilder.highlighter_with_gradient({
            wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
        }),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
    })
    ))
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
