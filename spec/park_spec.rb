require 'rspec'
require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  describe '#initialize' do
    it 'exists' do
      denver_city_park = Park.new("Denver City Park", 10)

      expect(denver_city_park). to be_an_instance_of Park
    end

    it 'has attributes' do
      denver_city_park = Park.new("Denver City Park", 10)

      expect(denver_city_park.name).to eq("Denver City Park")
      expect(denver_city_park.price).to eq 10
    end
  end

  describe '#vehicles' do
    it 'can have vehicles enter the park' do
      denver_city_park = Park.new("Denver City Park", 10)
      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2013", "Jeep", "Grand Cherokee")

      expect(denver_city_park.vehicles_entered).to eq([])

      denver_city_park.enter_park(vehicle_1)

      expect(denver_city_park.vehicles_entered).to eq([vehicle_1])

      denver_city_park.enter_park(vehicle_2)

      expect(denver_city_park.vehicles_entered).to eq([vehicle_1, vehicle_2])
      expect(denver_city_park.total_vehicles).to eq 2
    end

    it 'can read vehicle data' do
      denver_city_park = Park.new("Denver City Park", 10)
      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2013", "Jeep", "Grand Cherokee")

      denver_city_park.enter_park(vehicle_1)
      denver_city_park.enter_park(vehicle_2)

      expect(vehicle_1.year).to eq("2001")
      expect(vehicle_1.make).to eq("Honda")
      expect(vehicle_1.model).to eq("Civic")
      expect(vehicle_2.year).to eq("2013")
      expect(vehicle_2.make).to eq("Jeep")
      expect(vehicle_2.model).to eq("Grand Cherokee")
    end
  end

  describe '#passengers' do
    it 'can list all passengers in park' do
      denver_city_park = Park.new("Denver City Park", 10)
      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2013", "Jeep", "Grand Cherokee")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle_1.add_passenger(charlie)
      vehicle_2.add_passenger(taylor)

      denver_city_park.enter_park(vehicle_1)
      denver_city_park.enter_park(vehicle_2)

      expect(denver_city_park.passengers).to eq([charlie, taylor])
    end
  end

  describe '#revenue' do
    it 'can calculate revenue generated based on number of adults' do
      denver_city_park = Park.new("Denver City Park", 10)
      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2013", "Jeep", "Grand Cherokee")
      vehicle_3 = Vehicle.new("2008", "Honda", "Pilot")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jeff = Passenger.new({"name" => "Jeff", "age" => 23})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle_1.add_passenger(charlie)
      vehicle_2.add_passenger(taylor)
      vehicle_3.add_passenger(jeff)

      denver_city_park.enter_park(vehicle_1)
      denver_city_park.enter_park(vehicle_2)
      denver_city_park.enter_park(vehicle_3)

      expect(denver_city_park.revenue).to eq 20
    end
  end


end