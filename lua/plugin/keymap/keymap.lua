local maps = {}
local wk = require('which-key')

function maps.fzf ()
    wk.register({
        f = {
            name = 'Fzf',
            f = { '<cmd>Files<cr>', 'Find file' },
            r = { '<cmd>Rg<cr>', 'Grep' },
            L = { '<cmd>Lines<cr>', 'Lines in loaded buffers' },
            l = { '<cmd>BLines<cr>', 'Lines in current buffer' },
            b = { '<cmd>Buffers<cr>', 'Buffers' },
            h = { '<cmd>Helptags<cr>', 'Help tags' },
            c = { '<cmd>Commands<cr>', 'Commands' },
            p = { '<cmd>History/<cr>', 'Search history' },
            g = {
                name = 'Git',
                f = { '<cmd>GFiles<cr>', 'Git files' },
                C = { '<cmd>Commits<cr>', 'Git commits' },
                c = { '<cmd>BCommits<cr>', 'Git commits for the current buffer' },
                s = { '<cmd>GFiles?<cr>', 'Git status' }
            }
        }
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.buffer ()
    wk.register({
        b = {
            name = 'Buffer',
            l = {'<cmd>BufferLineCycleNext<cr>', 'Next buffer'},
            h = {'<cmd>BufferLineCyclePrev<cr>', 'Prev buffer'},
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
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.tree ()
    wk.register({
        t = {
            name = 'Tree',
            t = {'<cmd>NvimTreeToggle<cr>', 'Toggle tree'}
        },
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.bookmark ()
    wk.register({
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
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.zenmode ()
    wk.register({
        z = {'<cmd>ZenMode<cr>', 'Zen mode toggle'},
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.interestingwords ()
    wk.register({
        k = {'<cmd>call InterestingWords("n")<cr>', 'Keyword toggle'},
        K = {'<cmd>call UncolorAllWords()<cr>', 'Keyword remove all'},
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.motion ()
    wk.register({
        m = {'<cmd>HopChar1<cr>', 'Go char1'},
        c = {'<cmd>HopChar2<cr>', 'Go char2'},
        w = {'<cmd>HopWord<cr>', 'Go word'},
        l = {'<cmd>HopLine<cr>', 'Go line'},
        s = {'<cmd>HopLineStart<cr>', 'Go line start'},
    }, { mode = 'n', prefix = 'm', buffer = nil, silent = false, noremap = true, nowait = false })

    wk.register({
        m = {'<cmd>HopChar1<cr>', 'Go char1'},
        c = {'<cmd>HopChar2<cr>', 'Go char2'},
        w = {'<cmd>HopWord<cr>', 'Go word'},
        l = {'<cmd>HopLine<cr>', 'Go line'},
        s = {'<cmd>HopLineStart<cr>', 'Go line start'},
    }, { mode = 'v', prefix = 'm', buffer = nil, silent = false, noremap = true, nowait = false })
end

function maps.treesitter ()
    wk.register({
        t = {
            name = 'Tree/Treesitter',
            p = {'<cmd>TSPlaygroundToggle<cr>', 'TS playground toggle'},
            h = {'<cmd>TSHighlightCapturesUnderCursor<cr>', 'TS highlight info'},
        },
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.lspsaga ()
    vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { noremap = true })
    -- vim.api.nvim_set_keymap('n', '<C-d>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', { noremap = true })
    -- vim.api.nvim_set_keymap('n', '<C-u>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>', { noremap = true })

    wk.register({
        h = {'<cmd>Lspsaga lsp_finder<cr>', 'LSP finder'},
        s = {'<cmd>Lspsaga signature_help<cr>', 'LSP signature help'},
        r = {'<cmd>Lspsaga rename<cr>', 'LSP rename'},
        d = {'<cmd>Lspsaga preview_definition<cr>', 'LSP preview definition'},
    }, { mode = 'n', prefix = 'g', buffer = nil, silent = true, noremap = true, nowait = false })

    wk.register({
        l = {
            name = 'LSP',
            a = {'<cmd>Lspsaga code_action<cr>', 'LSP action'},
            d = {'<cmd>Lspsaga show_line_diagnostics<cr>', 'LSP show line diagnostics'},
            w = {
                name = 'Workspace',
                a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'LSP workspace add'},
                r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'LSP workspace remove'},
                l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'LSP workspace list'},
            }
        }
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })

    wk.register({
        l = {
            name = 'LSP',
            a = {'<cmd><C-u>Lspsaga range_code_action<cr>', 'LSP action'},
        }
    }, { mode = 'v', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

local function neogit ()
    wk.register({
        g = {
            name = 'Git',
            s = {'<cmd>Neogit<cr>', 'Neogit status'},
            v = {'<cmd>Neogit kind=vsplit<cr>', 'Neogit status (vsplit)'},
            c = {'<cmd>Neogit commit<cr>', 'Neogit commit'},
        }
    }, { mode = 'n', prefix = '<leader>', buffer = nil, silent = true, noremap = true, nowait = false })
end

function maps.premap ()
    neogit()
end

return maps
