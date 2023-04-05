require 'pry'

class Passenger
  attr_reader :name, :age, :driver

  def initialize(attributes)
    @name = attributes["name"]
    @age = attributes["age"]
    @driver = false

  end

  def adult?
    @age >= 18
  end

  def drive
    @driver = true if adult?
  end

  def driver?
    false
  end
end