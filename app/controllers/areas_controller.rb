class AreasController < ApplicationController

  # GET /areas
  def index
    factory = RGeo::GeoJSON::EntityFactory.instance
    features = Area.all.map{ |a| factory.feature a.geom }
    feature_collection = factory.feature_collection features
    @areas = RGeo::GeoJSON.encode feature_collection

    render json: @areas
  end
end
