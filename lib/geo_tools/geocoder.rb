require 'geo_tools/geocode_error'
require 'net/http'

module GeoTools
  class Geocoder
    API_URL = 'https://nominatim.openstreetmap.org/'.freeze

    def geocode(name)
      request(name)
    end

    private

    def request(query, format='geojson')
      query = URI.escape(query)
      url = API_URL + 'search?format=' + format + '&q=' + query
      uri = URI(url)
      req = Net::HTTP::Get.new(uri)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
      res = RGeo::GeoJSON.decode res.body
      raise GeoTools::NoResults if res.size == 0

      res.first
    end
  end
end
