module Joyent
  class Machines
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/machines").map{|attributes| Joyent::Machine.new(self, attributes)}
    end

    def get(id)
      Joyent::Machine.new(@connection, @connection.execute(:get, "/machines/#{id}"))
    end

    def create(attributes = {})
      Joyent::Machine.new(@connection, @connection.execute(:post, "/machines", attributes))
    end
  end
end
