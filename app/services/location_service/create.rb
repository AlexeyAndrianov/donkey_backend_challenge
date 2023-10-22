# frozen_string_literal: true

module LocationService
  class Create
    require 'redis'

    REDIS_KEY_PREFIX = 'locations'.freeze

    def self.call(params)
      $redis.rpush("bike:#{params[:location][:bike_id]}:locations", params[:location].to_json)
    end
  end
end
