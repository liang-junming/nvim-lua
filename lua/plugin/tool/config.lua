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
end

config.bookmark = function ()
    vim.g.bookmark_no_default_key_mappings = 1
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
    wk.register({
        f = {
            name = 'Telescop',
            f = { '<cmd>Telescop find_files<cr>', 'Find file' },
            r = { '<cmd>Telescop live_grep<cr>', 'Grep' },
            R = { '<cmd>Telescop live_grep grep_open_files=true<cr>', 'Grep in open files' },
            w = { '<cmd>Telescop current_buffer_fuzzy_find<cr>', 'Fuzzy find in current buffer' },
            b = { '<cmd>Telescop buffers<cr>', 'Buffers' },
            h = { '<cmd>Telescop help_tags<cr>', 'Help tags' },
            c = { '<cmd>Telescop builtin<cr>', 'Telescop builtin commands' },
            p = { '<cmd>Telescop project<cr>', 'Telescop project' },
            g = {
                name = 'Git',
                f = { '<cmd>Telescop git_files<cr>', 'Git files' },
                C = { '<cmd>Telescop git_commits<cr>', 'Git commits' },
                c = { '<cmd>Telescop git_bcommits<cr>', 'Git bcommits' },
                s = { '<cmd>Telescop git_status<cr>', 'Git status' }
            }
        },
        b = {
            name = 'Buffer',
            j = {'<cmd>BufferLineCycleNext<cr>', 'Next buffer'},
            k = {'<cmd>BufferLineCyclePrev<cr>', 'Prev buffer'},
            n = {'<cmd>BufferLineMoveNext<cr>', 'Move next'},
            p = {'<cmd>BufferLineMovePrev<cr>', 'Move prev'},
            s = {'<cmd>BufferLinePick<cr>', 'Select'},
            c = {'<cmd>BufferLinePickClose<cr>', 'Select to close'},
            x = {'<cmd>BufferLineCloseLeft<cr>', 'Close left'},
            X = {'<cmd>BufferLineCloseRight<cr>', 'Close right'},
            o = {
                name = 'Sort',
                d = {'<cmd>BufferLineSortByDirectory<cr>', 'Sort by directory'},
                e = {'<cmd>BufferLineSortByExtension<cr>', 'Sort by extension'},
                D = {'<cmd>BufferLineSortByRelativeDirectory<cr>', 'Sort by relative directory'},
                t = {'<cmd>BufferLineSortByTabs<cr>', 'Sort by tabs'},
            }
        },
        t = {
            name = 'Tree',
            t = {'<cmd>NvimTreeToggle<cr>', 'Toggle tree'}
        },
        m = {
            name = 'BookMark',
            m = {'<cmd>BookmarkToggle<cr>', 'Toggle'},
            i = {'<cmd>BookmarkAnnotate<cr>', 'Annotate'},
            n = {'<cmd>BookmarkNext<cr>', 'Next'},
            p = {'<cmd>BookmarkPrev<cr>', 'Prev'},
            c = {'<cmd>BookmarkClear<cr>', 'Clear'},
            x = {'<cmd>BookmarkClearAll<cr>', 'Clear all'},
            a = {
                function ()
                    local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions
                    require('telescope').extensions.vim_bookmarks.all {
                        attach_mappings = function(_, map)
                            map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)
                            map('n', 'dc', bookmark_actions.delete_at_cursor)
                            map('n', 'ds', bookmark_actions.delete_selected)
                            map('n', 'da', bookmark_actions.delete_all)
                            return true
                        end
                    }
                end,
                'Show all'
            }
        },
        z = {'<cmd>ZenMode<cr>', 'Zen mode toggle'}
    },
    {
        mode = 'n',
        prefix = '<leader>',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    })
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

return config
