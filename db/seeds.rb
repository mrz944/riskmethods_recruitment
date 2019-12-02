file = File.read('db/seeds/Given_areas.json')

feature_collection = RGeo::GeoJSON.decode(file)
feature_collection.each do |feature|
  Area.create(geom: feature.geometry)
end
