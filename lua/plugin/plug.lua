local plug = {}


plug.plug_load = function ()
    local ui_cfg = require 'plugin.ui.config'
    local tool_cfg = require 'plugin.tool.config'
    local edit_cfg = require 'plugin.edit.config'
    local lang_cfg = require 'plugin.lang.config'
    local comp_cfg = require 'plugin.comp.config'

    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        -- UI
        {
            'liang-junming/vim-sialoquent',
            lazy = false,
            priority = 1000,
            config = ui_cfg.color_theme
        },

        'arcticicestudio/nord-vim',

        'tomasr/molokai',

        'joshdick/onedark.vim',

        {
            'goolord/alpha-nvim',
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = ui_cfg.alpha
        },

        {
            'hoob3rt/lualine.nvim',
            config = ui_cfg.lualine
        },

        {
            'akinsho/bufferline.nvim',
            version = 'v3.*',
            dependencies = 'nvim-tree/nvim-web-devicons',
            event = 'BufRead',
            config = ui_cfg.bufferline
        },

        {
            'kyazdani42/nvim-tree.lua',
            cmd = 'NvimTreeToggle',
            init = function ()
                require('plugin.keymap.keymap').tree()
            end,
            config = ui_cfg.nvimtree
        },

        {
            'lewis6991/gitsigns.nvim',
            dependencies = {
                -- 'nvim-lua/plenary.nvim'
            },
            event = 'BufRead',
            config = ui_cfg.gitsigns
        },

        {
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = ui_cfg.indent_blankline
        },

        {
            "folke/zen-mode.nvim",
            event = 'BufRead',
            config = ui_cfg.zen_mod
        },

        {
            'norcalli/nvim-colorizer.lua',
            event = 'BufRead',
            config = ui_cfg.colorizer
        },

        -- TOOLS
        {
        'junegunn/fzf.vim',
            dependencies = {
                'junegunn/fzf',
                'r08ertliu/cscope-fzf'
            },
            config = tool_cfg.fzf
        },

        {
            'MattesGroeger/vim-bookmarks',
            config = tool_cfg.bookmark
        },

        {
            'folke/which-key.nvim',
            config = tool_cfg.which_key
        },

        {
            'dstein64/vim-startuptime'
        },

        {
            'gelguy/wilder.nvim',
            dependencies = 'romgrk/fzy-lua-native',
            event = 'CmdlineEnter',
            build = ':UpdateRemotePlugins',
            config = tool_cfg.wilder
        },

        {
            'yianwillis/vimcdoc'
        },

        {
            'tyru/caw.vim',
            event = "BufRead"
        },

        {
            'ethanholz/nvim-lastplace',
            config = tool_cfg.lastplace
        },

        {
            'vasconcelloslf/vim-interestingwords',
            event = "BufRead",
            config = tool_cfg.interestingwords
        },

        {
            'TimUntersberger/neogit',
            dependencies = 'nvim-lua/plenary.nvim',
            cmd = 'Neogit',
            init = function ()
                require('plugin.keymap.keymap').neogit()
            end,
            config = tool_cfg.neogit
        },

        -- EDIT
        {
            'phaazon/hop.nvim',
            branch = 'v2',
            config = edit_cfg.hop
        },

        -- LANG
        {
            'nvim-treesitter/nvim-treesitter',
            dependencies = 'nvim-treesitter/playground',
            event = 'BufRead',
            build = ':TSUpdate',
            config = lang_cfg.treesitter
        },

    -- nvim-treesitter-textobjects 目前不稳定
    -- use {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     opt = true,
    --     after = 'nvim-treesitter'
    -- }

    -- use {
    --     'romgrk/nvim-treesitter-context',
    --     opt = true,
    --     after = 'nvim-treesitter'
    -- }

        {
            'neovim/nvim-lspconfig',
            dependencies = 'williamboman/nvim-lsp-installer',
            event = 'BufRead',
            config = lang_cfg.lspconfig
        },

        {
            'glepnir/lspsaga.nvim',
            event = 'BufRead',
            config = lang_cfg.lspsaga
        },

        --COMPLETION
        {
            'hrsh7th/nvim-cmp',
            event = 'BufRead',
            config = comp_cfg.nvimcmp,
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                {
                    'L3MON4D3/LuaSnip',
                    config = comp_cfg.luasnip
                },
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lua',
                {
                    'windwp/nvim-autopairs',
                    config = comp_cfg.autopairs
                }
            }
        }
    }, {
        ui = {
            icons = {
                cmd = " ",
                config = "",
                event = "ﳅ ",
                ft = " ",
                init = " ",
                import = " ",
                keys = " ",
                lazy = "鈴 ",
                loaded = "●",
                not_loaded = "○",
                plugin = " ",
                runtime = " ",
                source = " ",
                start = "󰅕 ",
                task = "✔ ",
                list = {
                    "●",
                    "➜",
                    "★",
                    "‒",
                },
            },
        }
    })
end

return plug
