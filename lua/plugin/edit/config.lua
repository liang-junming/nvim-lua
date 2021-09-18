local config = {}

-- Auto pairs
function config.pears ()
    require 'pears'.setup()
end

function config.hop ()
    require 'hop'.setup {
        keys = 'etovxqpdygfblzhckisuran' 
    }
    require('plugin.keymap.keymap').motion()
end

return config
