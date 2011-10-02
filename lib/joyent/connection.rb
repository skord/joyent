module Joyent
  class Connection
    def initialize(username, password, datacenter = Datacenters.default)
      @http_connection = Net::HTTP.new(datacenter, 443)
      @http_connection.use_ssl = true
      @http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE

      @username = username
      @password = password
    end

    def headers
      {
        "X-Api-Version" => Joyent::API_VERSION
      }
    end

    def execute(http_method, url, data = {})
      case http_method
      when :get
        request = Net::HTTP::Get.new("/#{@username}#{url}", self.headers)
      when :post
        request = Net::HTTP::Post.new("/#{@username}#{url}", self.headers)
        request.set_form_data(data)
      when :delete
        request = Net::HTTP::Delete.new("/#{@username}#{url}", self.headers)
      else
        raise "HTTP method #{http_method} not supported"
      end

      request.basic_auth(@username, @password)

      response = @http_connection.request(request)

      if response.code =~ /^2/
        if response.body.nil? or response.body.empty?
          nil
        else
          JSON.parse(response.body)
        end
      else
        raise "#{response.code}: #{response.message} - #{response.body}"
      end
    end

    def keys
      @keys ||= Joyent::Keys.new(self)
    end

    def datacenters
      @datacenters ||= Joyent::Datacenters.new(self)
    end

    def datasets
      @datasets ||= Joyent::Datasets.new(self)
    end

    def packages
      @packages ||= Joyent::Packages.new(self)
    end

    def machines
      @machines ||= Joyent::Machines.new(self)
    end
  end
end
