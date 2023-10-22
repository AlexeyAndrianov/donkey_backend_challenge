# frozen_string_literal: true

module LocationService
  class Create
    require 'redis'

    REDIS_KEY_PREFIX = 'locations'.freeze

    def self.call(params)
      $redis.rpush("bike:#{params[:location][:bike_id]}:locations", location_params(params).to_json)
    end

    def self.location_params(params)
      params[:location].merge(sent_timestamp: Time.current.iso8601)
    end
  end
end
