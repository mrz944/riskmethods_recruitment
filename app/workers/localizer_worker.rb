class LocalizerWorker
  include Sidekiq::Worker

  def perform(location_id)
    location = Location.find(location_id)
    wkt_point = location.geom.as_text
    Area.all.each do |area|
      wkt_polygon = area.geom.as_text
      if GeoTools::Polygon.new(wkt_polygon).contains?(wkt_point)
        location.update_column(:area_id, area.id)
        break
      end
    end
  end
end
