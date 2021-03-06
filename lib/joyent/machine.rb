module Joyent
  class Machine
    attr_reader :id, :name, :type, :state, :dataset, :memory, :disk, :ips, :metadata, :created, :updated

    def initialize(connection, attributes)
      @connection = connection

      @id = attributes["id"]
      @name = attributes["name"]
      @type = attributes["type"]
      @state = attributes["state"]
      @dataset = attributes["dataset"]
      @memory = attributes["memory"]
      @disk = attributes["disk"]
      @ips = attributes["ips"]
      @metadata = attributes["metadata"]
      @created = attributes["created"]
      @updated = attributes["updated"]
    end

    def stop
      @connection.execute(:post, "/machines/#{self.id}", {"action" => "stop"})
    end

    def start
      @connection.execute(:post, "/machines/#{self.id}", {"action" => "start"})
    end

    def reboot
      @connection.execute(:post, "/machines/#{self.id}", {"action" => "reboot"})
    end

    def resize(package)
      @connection.execute(:post, "/machines/#{self.id}", {"action" => "resize", "package" => package})
    end

    def delete
      @connection.execute(:delete, "/machines/#{self.id}")
    end
  end
end
