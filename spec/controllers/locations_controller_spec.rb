require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe "POST create" do
    specify "it creates a location for given bike" do
      bike = Bike.create!(name: "The Bike")
      other_bike = Bike.create!(name: "Other Bike")

      post :create, params: {
        location: {
          bike_id: bike.id,
          latitude: 55.666137,
          longitude: 12.580222
        }
      }

      expect(response.status).to eq(201)
      expect(bike.locations.count).to eq(1)
      expect(other_bike.locations.count).to eq(0)
    end
  end
end
