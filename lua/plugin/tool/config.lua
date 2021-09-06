local config = {}

config.telescop = function ()
    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔍 ',
            selection_caret = 'ﰲ ',
            entry_prefix = "  ",
        }
    }
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
            f = { '<cmd>Telescop find_files<cr>', 'Find file', noremap=true },
            r = { '<cmd>Telescop live_grep<cr>', 'Grep', noremap=true },
            R = { '<cmd>Telescop live_grep grep_open_files=true<cr>', 'Grep in open files', noremap=true },
            w = { '<cmd>Telescop current_buffer_fuzzy_find<cr>', 'Fuzzy find in current buffer', noremap=true },
            b = { '<cmd>Telescop buffers<cr>', 'Buffers', noremap=true },
            h = { '<cmd>Telescop help_tags<cr>', 'Help tags', noremap=true },
            c = { '<cmd>Telescop builtin<cr>', 'Telescop builtin commands', noremap=true },
            g = {
                name = 'Git',
                f = { '<cmd>Telescop git_files<cr>', 'Git files', noremap=true },
                C = { '<cmd>Telescop git_commits<cr>', 'Git commits', noremap=true },
                c = { '<cmd>Telescop git_bcommits<cr>', 'Git bcommits', noremap=true },
                s = { '<cmd>Telescop git_status<cr>', 'Git status', noremap=true }
            }
        }
    }, { prefix = '<leader>' })
end

return config
