module Joyent
  class Datacenters
    def initialize(connection)
      @connection = connection
    end

    def self.default
      Joyent::API_ENDPOINT
    end

    def list
      @connection.execute(:get, "/datacenters").map{|name, url| Joyent::Datacenter.new(name, url)}
    end

    def get(name)
      Joyent::Datacenter.new(name, @connection.execute(:get, "/datacenters")[name])
    end
  end
end
