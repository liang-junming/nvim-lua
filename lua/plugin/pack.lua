local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/lua/packer_compiled.lua'
local packer = nil

local function load_packer()
    if not packer then
        vim.cmd 'packadd packer.nvim'
        packer = require('packer')
    end
    packer.init({
        compile_path = compile_path,
        git = {
            clone_timeout = 300,
            default_url_format = 'https://ghproxy.com/https://github.com/%s'
        },
        disable_commands = true
    })
    packer.reset()

    local use = packer.use
    local ui_cfg = require 'plugin.ui.config'
    local tool_cfg = require 'plugin.tool.config'
    local edit_cfg = require 'plugin.edit.config'
    local lang_cfg = require 'plugin.lang.config'
    local comp_cfg = require 'plugin.comp.config'

    use {'wbthomason/packer.nvim', opt = true}
    -- UI
    use {
        'liang-junming/vim-sialoquent',
        requires = {
            'arcticicestudio/nord-vim',
            'tomasr/molokai',
            'joshdick/onedark.vim',
        },
        config = ui_cfg.color_theme
    }
    use {
        'glepnir/dashboard-nvim',
        opt = true,
        event = 'BufWinEnter',
        setup = ui_cfg.dashboard
    }
    use {
        'kyazdani42/nvim-web-devicons'
    }
    use {
        'hoob3rt/lualine.nvim',
        config = ui_cfg.lualine
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = ui_cfg.bufferline
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = ui_cfg.nvimtree
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = ui_cfg.gitsigns
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = ui_cfg.indent_blankline
    }
    use {
        "folke/zen-mode.nvim",
        config = ui_cfg.zen_mod
    }
    use {
        'norcalli/nvim-colorizer.lua',
        event = 'BufRead',
        config = ui_cfg.colorizer
    }

    -- TOOLS
    use {
        'junegunn/fzf.vim',
        requires = {
            'junegunn/fzf',
            'r08ertliu/cscope-fzf'
        },
        config = tool_cfg.fzf
    }
    use {
        'MattesGroeger/vim-bookmarks',
        config = tool_cfg.bookmark
    }
    use {
        'folke/which-key.nvim',
        config = tool_cfg.which_key
    }
    use {
        'dstein64/vim-startuptime'
    }
    use {
        'gelguy/wilder.nvim',
        event = 'CmdlineEnter',
        run = ':UpdateRemotePlugins',
        requires = { 'romgrk/fzy-lua-native', after = 'wilder.nvim' },
        config = tool_cfg.wilder
    }
    use {
        'yianwillis/vimcdoc'
    }
    use {
        'tyru/caw.vim'
    }
    use {
        'ethanholz/nvim-lastplace',
        config = tool_cfg.lastplace
    }
    use {
        'vasconcelloslf/vim-interestingwords',
        config = tool_cfg.interestingwords
    }
    use {
        'TimUntersberger/neogit',
        cmd = 'Neogit',
        requires = {
            { 'nvim-lua/plenary.nvim', after = 'neogit' },
            { 'sindrets/diffview.nvim', after = 'neogit' },
        },
        config = tool_cfg.neogit
    }

    -- EDIT
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = edit_cfg.hop
    }

    -- LANG
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        run = ':TSUpdate',
        config = lang_cfg.treesitter
    }
    -- nvim-treesitter-textobjects 目前不稳定
    -- use {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     opt = true,
    --     after = 'nvim-treesitter'
    -- }
    use {
        'nvim-treesitter/playground',
        opt = true,
        after = 'nvim-treesitter'
    }
    -- use {
    --     'romgrk/nvim-treesitter-context',
    --     opt = true,
    --     after = 'nvim-treesitter'
    -- }
    use {
        'neovim/nvim-lspconfig',
        requires = { 'williamboman/nvim-lsp-installer' },
        config = lang_cfg.lspconfig
    }
    use {
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        config = lang_cfg.lspsaga
    }

    --COMPLETION
    use {
        'hrsh7th/nvim-cmp',
        event = 'BufRead',
        config = comp_cfg.nvimcmp,
        requires = {
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'L3MON4D3/LuaSnip', after = 'nvim-cmp', config = comp_cfg.luasnip },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'windwp/nvim-autopairs', after = 'nvim-cmp', config = comp_cfg.autopairs }
        }
    }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        if not packer then load_packer() end
        return packer[key]
    end
})

function plugins.promise_install()
    if fn.empty(fn.glob(install_path)) > 0 then
        print('Cloneing packer.nvim...')
        fn.system({'git', 'clone', 'https://ghproxy.com/https://github.com/wbthomason/packer.nvim', install_path})
        load_packer()
        packer.install()
    end
end

function plugins.load_compiled()
    if vim.fn.filereadable(compile_path) == 1 then
        require 'packer_compiled'
    else
        print('Missing packer compile file Run PackerCompile Or PackerSync to fix')
    end
end

function plugins.regist_command()
    local cmd = vim.cmd
    cmd [[command! WhatHighlight :call util#syntax_stack()]]
    cmd [[command! PackerInstall lua require('plugin.pack').install()]]
    cmd [[command! PackerUpdate lua require('plugin.pack').update()]]
    cmd [[command! PackerSync lua require('plugin.pack').sync()]]
    cmd [[command! PackerClean lua require('plugin.pack').clean()]]
    cmd [[command! PackerCompile lua require('plugin.pack').compile()]]
    cmd [[autocmd User PackerComplete lua require('plugin.pack').compile()]]
    cmd [[command! PackerStatus lua require('plugin.pack').status()]]
end

return plugins
