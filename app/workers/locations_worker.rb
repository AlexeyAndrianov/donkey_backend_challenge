# frozen_string_literal: true

class LocationsWorker
  include Sidekiq::Worker

  def perform
    bike_ids = Bike.all.pluck(:id)

    bike_ids.each do |bike_id|
      location_params = $redis.lrange("bike:#{bike_id}:locations", 0, -1)

      location_params&.each do |params_set|
        location = Location.create(JSON.parse(params_set))

        Rails.logger.error("Couldn't create location with params: #{params_set}") unless location&.save
      end

      $redis.del("bike:#{bike_id}:locations")
    end

  end
end
