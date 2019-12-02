module GeoTools
  class GeocodeError < StandardError; end

  class NoResults < GeocodeError; end
  # TODO: handle Open Street Map Nominatum API errors
  # (which are not well documented)
end
