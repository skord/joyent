module Joyent
  class Machines
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/machines").map{|attributes| Joyent::Machine.new(attributes)}
    end

    def get(id)
      Joyent::Machine.new(@connection.execute(:get, "/machines/#{id}"))
    end

    def create(attributes = {})
      Joyent::Machine.new(@connection.execute(:post, "/machines", attributes))
    end
  end
end
