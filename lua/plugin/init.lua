local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/lua/packer_compiled.lua'
local packer = nil

local function promise_packer_install()
    if fn.empty(fn.glob(install_path)) > 0 then
        dump('Cloneing packer.nvim...')
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd 'packadd packer.nvim'
    end
end

local function packer_init()
    if not packer then
        packer = require('packer')
    end
    packer.init({
        compile_path = compile_path,
        git = {
            clone_timeout = 300
        },
        disable_commands = true
    })
    packer.reset()
end

local function regist_packer_cmd()
    local cmd = vim.cmd
    cmd [[command! WhatHighlight :call util#syntax_stack()]]
    cmd [[command! PackerInstall packadd packer.nvim | lua require('packer').install()]]
    cmd [[command! PackerUpdate packadd packer.nvim | lua require('packer').update()]]
    cmd [[command! PackerSync packadd packer.nvim | lua require('packer').sync()]]
    cmd [[command! PackerClean packadd packer.nvim | lua require('packer').clean()]]
    cmd [[command! PackerCompile packadd packer.nvim | lua require('packer').compile()]]
end

local function plugin_load()
    local use = packer.use
    local ui_cfg = require 'plugin.ui.config'
    local tool_cfg = require 'plugin.tool.config'
    use {'wbthomason/packer.nvim'}
    -- UI
    use {
        'liang-junming/vim-sialoquent',
        config = ui_cfg.color_theme()
    }
    use {
        'glepnir/dashboard-nvim',
        opt = true,
        event = 'BufWinEnter',
        config = ui_cfg.dashboard()
    }
    use {
        'kyazdani42/nvim-web-devicons'
    }
    use {
        'hoob3rt/lualine.nvim',
        config = ui_cfg.lualine()
    }
    use {
        'akinsho/bufferline.nvim',
        config = ui_cfg.bufferline()
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = ui_cfg.nvimtree()
    }

    -- TOOLS
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = tool_cfg.telescop()
    }
    use {
        "folke/which-key.nvim",
        config = tool_cfg.which_key()
    }

    packer.install()
end

local function plugin_load_compiled()
    if vim.fn.filereadable(compile_path) == 1 then
        require 'packer_compiled'
    else
        dump('Missing packer compile file Run PackerCompile Or PackerSync to fix')
    end
end

local function after_plugin_load()
    vim.cmd [[colorscheme sialoquent]]
end

promise_packer_install()
packer_init()
regist_packer_cmd()
plugin_load()
plugin_load_compiled()
after_plugin_load()
