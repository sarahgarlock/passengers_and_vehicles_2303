require 'rspec'
require './lib/passenger'

RSpec.describe Passenger do
  describe '#initialize' do
    it 'exists' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie).to be_an_instance_of Passenger
      expect(taylor).to be_an_instance_of Passenger
    end

    it 'has attributes' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq 18
      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq 12
    end
  end 

  describe '#adult' do
    it 'is an adult if at least 18' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.adult?).to be true
      expect(taylor.adult?).to be false
    end
  end

  describe '#drive' do
    it 'is false for drive by default' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.driver?).to be false
      expect(taylor.driver?).to be false
    end 

    it 'can change drive to true' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      charlie.drive

      expect(charlie.drive).to eq true
    end
  end
end