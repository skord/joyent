module Joyent
  class Datacenter
    attr_reader :name, :url

    def initialize(name, url)
      @name = name
      @url = url
    end
  end
end
