module Joyent
  class Dataset
    attr_reader :id, :name, :os, :version, :urn, :type, :default, :requirements

    def initialize(attributes)
      @io = attributes["io"]
      @name = attributes["name"]
      @os = attributes["os"]
      @version = attributes["version"]
      @urn = attributes["urn"]
      @type = attributes["type"]
      @default = attributes["default"]
      @requirements = attributes["requirements"]
    end
  end
end
