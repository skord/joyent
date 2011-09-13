module Joyent
  class Package
    attr_reader :name, :memory, :disk, :swap, :default

    def initialize(attributes)
      @name = attributes["name"]
      @memory = attributes["memory"]
      @disk = attributes["disk"]
      @swap = attributes["swap"]
      @default = attributes["default"]
    end
  end
end
