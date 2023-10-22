# frozen_string_literal: true

module LocationService
  class Create
    require 'redis'

    REDIS_KEY_PREFIX = 'locations'.freeze

    def self.call(params)
      key = "#{REDIS_KEY_PREFIX}:#{params['location']['bike_id']}:#{Time.now.to_i}"

      $redis.hmset(key, 'bike_id', params['location']['bike_id'],
                     'latitude', params['location']['latitude'],
                     'longitude', params['location']['longitude'],
                     'created_at', params['created_at'].iso8601)

    end
  end
end
