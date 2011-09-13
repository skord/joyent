module Joyent
  class Packages
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/packages").map{|attributes| Joyent::Package.new(attributes)}
    end

    def get(name)
      Joyent::Package.new(@connection.execute(:get, "/packages/#{name}"))
    end
  end
end
