module Joyent
  class Datasets
    def initialize(connection)
      @connection = connection
    end

    def list
      @connection.execute(:get, "/datasets").map{|attributes| Joyent::Dataset.new(attributes)}
    end

    def get(name)
      Joyent::Dataset.new(@connection.execute(:get, "/datasets/#{name}"))
    end
  end
end
