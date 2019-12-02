class LocationsController < ApplicationController
  before_action :set_location, only: :show
  wrap_parameters :location, include: :name

  # GET /locations/1
  def show
    render json: LocationSerializer.new(@location)
  end

  # POST /locations
  def create
    geo = GeoTools::Geocoder.new.geocode(location_params[:name])
    params = {
      name: geo.properties['display_name'],
      geom: geo.geometry
    }

    @location = Location.new(params)

    if @location.save
      render json: { id: @location.id }, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  rescue GeoTools::NoResults
    head :unprocessable_entity
  rescue Timeout::Error, Errno::ECONNRESET, Errno::ECONNREFUSED
    head :request_timeout
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def location_params
    params.require(:location).permit(:name)
  end
end
