require 'rails_helper'

RSpec.describe LocationsWorker, type: :worker do
  describe '#perform' do
    let!(:bike1) { Bike.create(name: 'Bike 1') }
    let!(:bike2) { Bike.create(name: 'Bike 2') }
    let(:location_data) do
      {
        location: {
          bike_id: bike1.id,
          latitude: 55.666137,
          longitude: 12.580222,
          sent_timestamp: 2.days.ago
        }
      }
    end

    let(:another_location_data) do
      {
        location: {
          bike_id: bike2.id,
          latitude: 55.123456,
          longitude: 12.789012,
          sent_timestamp: 1.hour.ago
        }
      }
    end

    before do
      $redis.flushdb
      $redis.rpush("bike:#{bike1.id}:locations", location_data[:location].to_json)
      $redis.rpush("bike:#{bike2.id}:locations", location_data[:location].to_json)
      $redis.rpush("bike:#{bike1.id}:locations", another_location_data[:location].to_json)
    end


    it 'creates locations for bikes using Redis data' do
      expect($redis.llen("bike:#{bike1.id}:locations")).to eq(2)
      expect($redis.llen("bike:#{bike2.id}:locations")).to eq(1)
      
      LocationsWorker.new.perform
      
      expect(Location.count).to eq(3)
    end
  end
end
