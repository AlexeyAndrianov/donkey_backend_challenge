require 'rails_helper'

RSpec.describe LocationService::Create, type: :service do
  let(:bike) { Bike.create(name: 'The Bike') }
  let(:location_params) do
    {
      location: {
        bike_id: bike.id,
        latitude: 55.666137,
        longitude: 12.580222
      }
    }
  end

  subject { described_class.call(location_params) }

  it 'saves location data to Redis' do
    expected_key = "bike:#{bike.id}:locations"

    expect($redis).to receive(:rpush).with(
      expected_key,
      location_params[:location].to_json
    )

    subject
  end

  it 'uses a unique Redis key based on bike ID' do
    subject

    redis_key = "bike:#{bike.id}:locations"
    expect($redis.lrange(redis_key, 0, -1)).not_to be_empty
  end
end
