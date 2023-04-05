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

    it 'can be speeding when called' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      vehicle.speed
      
      expect(vehicle.speeding?). to be true
    end
  end

  describe '#passengers' do
    it 'starts with 0 passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.passengers).to eq([])
    end

    it 'can add passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20}) 
      taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end

    it 'adds number of adult passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20}) 
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.num_adults).to eq 2
    end
  end
end