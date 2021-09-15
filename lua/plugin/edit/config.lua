local config = {}

-- Auto pairs
function config.pears ()
    require 'pears'.setup()
end

function config.hop ()
    require 'hop'.setup {
        keys = 'etovxqpdygfblzhckisuran' 
    }
end

return config
