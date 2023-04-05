class Vehicle
  attr_reader :year,
              :make,
              :model,
              :speeding,
              :passengers,
              :park_passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
    @park_passengers = []

  end

  def speed
    @speeding = true
  end

  def speeding?
    @speeding
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.count(&:adult?)
  end

end