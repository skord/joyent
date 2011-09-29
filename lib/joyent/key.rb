module Joyent
  class Key
    attr_reader :name, :key

    def initialize(connection, attributes)
      @connection = connection

      @name = attributes["name"]
      @key = attributes["key"]
    end
  end
end
