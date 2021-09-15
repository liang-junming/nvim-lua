local common = {}

function set_option ()
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.laststatus = 2
    vim.o.scrolloff = 2 --光标距离页面底端永远保留2行位置
    vim.o.encoding = 'utf-8'
    vim.o.cursorline = true
    vim.o.timeoutlen = 300
    vim.o.foldmethod = 'syntax'
    vim.o.foldlevel = 99
    vim.o.expandtab = true
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.smartindent = true
    vim.o.incsearch = true
    vim.o.hlsearch = true
    vim.o.ignorecase = true
    vim.o.smartcase = true
end

function set_global ()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ';'
end

function set_keymap ()
    vim.api.nvim_set_keymap('!', 'jk', '<Esc>', { noremap = true })
end

function common.set_common ()
    set_option()
    set_global()
    set_keymap()
end

return common
