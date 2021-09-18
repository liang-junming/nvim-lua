local config = {}

config.telescop = function ()
    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔍 ',
            selection_caret = '● ',
            entry_prefix = '  ',
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
    require('plugin.keymap.keymap').telescop()
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
end

config.wilder = function ()
    vim.cmd [[
    call wilder#enable_cmdline_enter()
    set wildcharm=<Tab>
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

    " only / and ? are enabled by default
    call wilder#set_option('modes', ['/', '?', ':'])
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

return config
