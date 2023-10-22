require 'rails_helper'

RSpec.describe LocationService::Create, type: :service do
  let(:bike) { Bike.create(name: 'The Bike') }
  let(:location_params) do
    {
      'location' => {
        'bike_id' => bike.id,
        'latitude' => 55.666137,
        'longitude' => 12.580222
      },
      'created_at' => Time.current
    }
  end

  subject { described_class.call(location_params) }

  it 'saves location data to Redis' do
    expected_key = "locations:#{bike.id}:"

    expect($redis).to receive(:hmset).with(
      a_string_matching(expected_key),
      'bike_id', bike.id,
      'latitude', location_params['location']['latitude'],
      'longitude', location_params['location']['longitude'],
      'created_at', location_params['created_at'].iso8601
    )

    subject
  end

  it 'uses a unique Redis key based on bike ID and timestamp' do
    redis_key = "locations:#{bike.id}:#{Time.current.iso8601}"

    expect($redis).to receive(:hmset) { |key, *| redis_key = key }

    subject

    expect(redis_key).to match(/locations:#{bike.id}:\d+/)
  end
end
