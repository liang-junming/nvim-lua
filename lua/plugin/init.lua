local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/pack/packer/packer_compiled.lua'
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

local function plugin_install()
    local use = packer.use
    local ui_cfg = require 'plugin.ui.config'
    use {'wbthomason/packer.nvim'}
    use {
        'liang-junming/vim-sialoquent',
        config = ui_cfg.color_theme()
    }
    packer.install()
end

promise_packer_install()
packer_init()
regist_packer_cmd()
plugin_install()
