module Joyent
  class Datacenters
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/datacenters").map{|name, url| Joyent::Datacenter.new(name, url)}
    end

    def get(name)
      datacenter_attributes = @connection.execute(:get, "/datacenters/#{name}")
      #Joyent::Datacenter.new(datacenter_attributes)
      datacenter_attributes
    end
  end
end
