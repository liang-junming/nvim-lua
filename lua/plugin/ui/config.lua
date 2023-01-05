local config = {}

config.color_theme = function ()
    vim.o.termguicolors = true
    vim.o.background = 'dark'

    -- color theme 'nord' config
    -- vim.g.nord_contrast = false
    -- vim.g.nord_borders = false
    -- vim.g.nord_disable_background = true
    -- vim.g.nord_italic = true

    vim.cmd [[colorscheme sialoquent]]
end

config.alpha = function ()
    require'alpha'.setup(require'alpha.themes.startify'.config)
    require('plugin.keymap.keymap').alpha()
end

config.lualine = function ()
    require'lualine'.setup {
        options = {
            icons_enabled = true,
            theme = 'nord',
            component_separators = {'', ''},
            section_separators = {'', ''}, --        
            disabled_filetypes = {},
            always_divide_middle = false,
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str) return str:sub(1,1) end
                }
            },
            lualine_b = {
                'branch',
                'diff',
                {
                    'diagnostics',
                    sources = { 'nvim_diagnostic', 'coc' }
                }
            },
            lualine_c = {
                {
                    'filename',
                    file_status = true,  -- displays file status (readonly status, modified status)
                    path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
                    shorting_target = 40 -- Shortens path to leave 40 space in the window
                    -- for other components. Terrible name any suggestions?
                }
            },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'},
        },
    }
end

config.bufferline = function ()
    require("bufferline").setup{
        options = {
            separator_style = 'slant',
            diagnostics = "nvim_lsp",
            indicator = {
                style = 'none',
            },
            offsets = {{
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }},
            color_icons = true,
            modified_icon = '●',
            buffer_close_icon = '',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            show_buffer_icons = true,
            show_close_icon = false,
        }
    }
    require('plugin.keymap.keymap').buffer()
end

config.nvimtree = function ()
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    require('nvim-tree').setup({
        view = {
            mappings = {
                list = {
                    { key = 'l',                            cb = tree_cb('edit') },
                    { key = 'h',                            cb = tree_cb('close_node') },
                    { key = '?',                            cb = tree_cb('toggle_help') },
                    { key = '<cr>',                         cb = tree_cb("cd") },
                    { key = '<C-v>',                        cb = tree_cb('vsplit') },
                    { key = '<C-x>',                        cb = tree_cb('split') },
                    { key = '<C-t>',                        cb = tree_cb('tabnew') },
                    { key = '<Tab>',                        cb = tree_cb('preview') },
                    { key = 's',                            cb = tree_cb('system_open') },
                    { key = 'q',                            cb = tree_cb('close') },

                    { key = "<",                            cb = tree_cb("prev_sibling") },
                    { key = ">",                            cb = tree_cb("next_sibling") },
                    { key = "P",                            cb = tree_cb("parent_node") },
                    { key = "<S-CR>",                       cb = tree_cb("close_node") },
                    { key = "K",                            cb = tree_cb("first_sibling") },
                    { key = "J",                            cb = tree_cb("last_sibling") },
                    { key = "I",                            cb = tree_cb("toggle_ignored") },
                    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
                    { key = "R",                            cb = tree_cb("refresh") },
                    { key = "a",                            cb = tree_cb("create") },
                    { key = "d",                            cb = tree_cb("remove") },
                    { key = "r",                            cb = tree_cb("rename") },
                    { key = "<C-r>",                        cb = tree_cb("full_rename") },
                    { key = "x",                            cb = tree_cb("cut") },
                    { key = "c",                            cb = tree_cb("copy") },
                    { key = "p",                            cb = tree_cb("paste") },
                    { key = "y",                            cb = tree_cb("copy_name") },
                    { key = "Y",                            cb = tree_cb("copy_path") },
                    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
                    { key = "[c",                           cb = tree_cb("prev_git_item") },
                    { key = "]c",                           cb = tree_cb("next_git_item") },
                    { key = "-",                            cb = tree_cb("dir_up") },
                }
            }
        }
    })

    require('plugin.keymap.keymap').tree()
end

config.gitsigns = function ()
    require('gitsigns').setup()
end

config.indent_blankline = function()
    require("indent_blankline").setup {
        char = "│",
        show_first_indent_level = true,
        filetype_exclude = {
            "startify", "dashboard", "dotooagenda", "log", "fugitive",
            "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
            "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
            "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
        },
        buftype_exclude = {"terminal", "nofile"},
        show_trailing_blankline_indent = true,
        show_current_context = false,
        context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for", "type", "var",
            "import"
        }
    }
end

config.zen_mod = function ()
    require('zen-mode').setup {
        window = {
            backdrop = 0.9
        }
    }
    require('plugin.keymap.keymap').zenmode()
end

function config.colorizer ()
    require 'colorizer'.setup {
        '*'; -- Highlight all files, but customize some others.
        css = {
            RRGGBBAA = true,        -- #RRGGBBAA hex codes
            rgb_fn   = true,        -- CSS rgb() and rgba() functions
            hsl_fn   = true,        -- CSS hsl() and hsla() functions
            css      = true,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn   = true,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
        }; -- Enable parsing rgb(...) functions in css.
    }
end

return config
