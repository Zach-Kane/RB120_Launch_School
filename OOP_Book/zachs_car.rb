module Nitrous
  def nitrous
    self.speed += 100
  end
end


class Vehicle
  attr_accessor :type, :make, :model, :state, :speed, :built

  @@number = 0

  def initialize(t, ma, mo, y)
    self.type = t
    self.make = ma
    self.model = mo
    self.built = y
  end
  def honk
    puts "Honk!"
  end

  def self.number
    puts @@number
  end

  def age
    puts Time.now.year - self.built
  end

end

class Automobile < Vehicle
  def initialize(t, ma, mo, y)
    @@number += 1

    super
  end

  include Nitrous
end

class Truck < Vehicle; end

zachs_car = Automobile.new("car", "Subaru", 'Outback', 1996 )
dudes_car = Automobile.new("this", "that", "other", 2000)
zachs_truck = Truck.new("4x4", "rumbu", "zoomer", 1880)
p zachs_car
zachs_car.state = 'moving'
zachs_car.speed = 20
zachs_car.honk
p zachs_car
p zachs_truck
p dudes_car
zachs_car.nitrous
p zachs_car
Vehicle.number
zachs_truck.age

puts Vehicle.ancestors