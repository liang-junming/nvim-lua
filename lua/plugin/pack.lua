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
            clone_timeout = 300
        },
        disable_commands = true
    })
    packer.reset()

    local use = packer.use
    local ui_cfg = require 'plugin.ui.config'
    local tool_cfg = require 'plugin.tool.config'

    use {'wbthomason/packer.nvim', opt = true}
    -- UI
    use {
        'liang-junming/vim-sialoquent',
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

    -- TOOLS
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = tool_cfg.telescop
    }
    use {
        'folke/which-key.nvim',
        config = tool_cfg.which_key
    }
    use {
        'dstein64/vim-startuptime'
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
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
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
end

return plugins
