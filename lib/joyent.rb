require 'net/http'
require 'net/https'

require 'json'

require File.join(File.dirname(__FILE__), 'joyent/connection')
require File.join(File.dirname(__FILE__), 'joyent/datacenters')
require File.join(File.dirname(__FILE__), 'joyent/datacenter')
require File.join(File.dirname(__FILE__), 'joyent/datasets')
require File.join(File.dirname(__FILE__), 'joyent/dataset')
require File.join(File.dirname(__FILE__), 'joyent/packages')
require File.join(File.dirname(__FILE__), 'joyent/package')
require File.join(File.dirname(__FILE__), 'joyent/machines')
require File.join(File.dirname(__FILE__), 'joyent/machine')

module Joyent
  API_ENDPOINT = "api.sdc1.joyentcloud.com"
  API_VERSION = "~6.5"
end
