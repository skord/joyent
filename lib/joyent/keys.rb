module Joyent
  class Keys
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/keys").map{|attributes| Joyent::Key.new(@connection, attributes)}
    end

    def get(name)
      Joyent::Key.new(@connection, @connection.execute(:get, "/keys/#{name}"))
    end

    def create(name, key)
      Joyent::Key.new(@connection, @connection.execute(:post, "/keys", {:name => name, :key => key}))
    end
  end
end
