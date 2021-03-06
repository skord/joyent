require 'net/http'
require 'net/https'

require 'json'

Dir.glob(File.join(File.dirname(__FILE__), 'joyent/*.rb')).each{|file| require file}

module Joyent
  API_ENDPOINT = "us-west-1.api.joyentcloud.com"
  API_VERSION = "~6.5"
end
