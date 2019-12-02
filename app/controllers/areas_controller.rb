class AreasController < ApplicationController

  # GET /areas
  def index
    @areas = Rails.cache.fetch("areas/#{Area.count}") do
      factory = RGeo::GeoJSON::EntityFactory.instance
      features = Area.all.map{ |a| factory.feature a.geom }
      feature_collection = factory.feature_collection features
      RGeo::GeoJSON.encode feature_collection
    end

    render json: @areas
  end
end
