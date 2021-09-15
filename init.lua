require 'util'
local common = require 'common'
local packer = require 'plugin.pack'

common.set_common()

packer.promise_install()
packer.load_compiled()
packer.regist_command()
