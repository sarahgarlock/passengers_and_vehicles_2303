class Park
  attr_reader :name, 
              :price, 
              :vehicles_entered
  def initialize(name, price)
    @name = name
    @price = price
    @vehicles_entered = []
  end

  def enter_park(vehicle)
    @vehicles_entered << vehicle
  end

  def total_vehicles
    @vehicles_entered.count
  end

  def passengers
    @vehicles_entered.map(&:passengers).flatten
  end

  # def revenue
  #   adult_passengers = passengers.select { |passenger| passenger.adult? }
  #   adult_passengers.count * @price
  # end
  
end