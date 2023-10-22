# frozen_string_literal: true

class LocationsController < ApplicationController
  def create
    LocationService::Create.call(params)
  end
end
