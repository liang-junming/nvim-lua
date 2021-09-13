local config = {}

config.telescop = function ()
    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔍 ',
            selection_caret = '● ',
            entry_prefix = '  ',
        },
    }
    require('telescope').load_extension('project')
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
        }
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

return config
