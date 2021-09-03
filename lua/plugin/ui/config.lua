local config = {}

config.color_theme = function ()
    vim.o.termguicolors = true
    vim.o.background = 'light'
    vim.cmd [[colorscheme sialoquent]]
end

return config
