class LocationsController < ApplicationController
  def create
    location = Location.create!(bike_id: params[:location][:bike_id],
                                latitude: params[:location][:latitude],
                                longitude: params[:location][:longitude])

    render status: :created,
           json: {
            id: location.id,
            bike_id: location.bike_id,
            latitude: location.latitude,
            longitude: location.longitude
          }
  end
end
