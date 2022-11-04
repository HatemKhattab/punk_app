module ApiClients
  class PunkClient
    def initialize
      @http_client = build_client
    end

    def search(str)
      @http_client.get("beers?beer_name=#{str}")
    end

    def get_beer(nr)
      @http_client.get("beers/#{nr}")
    end

    private

    def build_client
      Faraday.new("https://api.punkapi.com/v2/") do |f|
        f.response :json
      end
    end
  end
end
