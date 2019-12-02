class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :lng do |object|
    object.geom.coordinates[0]
  end

  attribute :lat do |object|
    object.geom.coordinates[1]
  end

  attribute :inside? do |object|
    object.area_id ? true : false
  end
end
