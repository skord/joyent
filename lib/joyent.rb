require 'net/http'
require 'net/https'

require 'json'

require 'lib/joyent/connection'
require 'lib/joyent/datasets'
require 'lib/joyent/dataset'
require 'lib/joyent/packages'
require 'lib/joyent/package'
require 'lib/joyent/machines'
require 'lib/joyent/machine'

module Joyent
  API_ENDPOINT = "api.sdc1.joyentcloud.com"
  API_VERSION = "=6.1.x"
end
