# frozen_string_literal: true

class LocationsController < ApplicationController
  def create
    location = LocationService::Create.call(location_params)
  end

  def location_params
    params.merge(created_at: Time.current)
  end

end
