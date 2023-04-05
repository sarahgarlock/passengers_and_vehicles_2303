require 'rspec'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  describe '#initialize' do
    it 'exists' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle).to be_an_instance_of Vehicle
    end

    it 'has attributes' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  describe '#speeding' do
    it 'is not speeding by default' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.speeding?).to be false
    end
  end
end