class MyCar
  attr_accessor :year, :color, :model, :speed, :state, :what

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @state = 'driving'
  end

  def spray_paint
    self.color = 'rainbow'
  end

  def speed_up
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def floor_it
    self.speed += 90
  end

  def what_speed
    "You are going #{speed} miles and hour"
  end
end

zachs_car = MyCar.new('1996', 'brown', 'poopoo')

p zachs_car.speed
zachs_car.speed_up
zachs_car.floor_it
zachs_car.stop
zachs_car.state = 'parked'
p zachs_car
zachs_car.what = 'yea'
zachs_car.spray_paint
p zachs_car