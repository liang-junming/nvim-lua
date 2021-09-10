require 'util'
local common = require 'common'
local packer = require 'plugin.pack'

common.set_option()
common.set_global()

packer.promise_install()
packer.load_compiled()
packer.regist_command()
