require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:bike) { Bike.create!(name: "The Bike") }
  let(:other_bike) { Bike.create!(name: "The Bike") }

  describe "POST create" do
    specify "it creates a location for given bike" do

      post :create, params: {
        location: {
          bike_id: bike.id,
          latitude: 55.666137,
          longitude: 12.580222
        }
      }

      expect(response.status).to eq(204)
      expect($redis.keys.count).to eq(1)
    end
  end
end
