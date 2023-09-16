class MyCar
  attr_accessor :year, :color, :model, :speed, :break_on,
                :car_state

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def info
    puts @what
    puts year
    puts speed
    puts break_on
    puts car_state
  end

  def to_s
    "This is something"
  end
  
  def change(b, s)
    @break = b
    @speed = s
  end

  def paint(color)
    @color = color
    puts "The car is now #{@color}"
  end

  def car_on
    @car_state = 'on'
  end

  def speed_up
    @speed = @speed.to_i
    @speed = @speed += 10
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @break_on = "on"
    @car_state = 'off'
    @what = "this"
  end
end

car = MyCar.new('2016', 'Red', "poopoo")



car.change("no", '35')

puts car

car.speed_up

car.car_state = 'poop'



car.paint("pee green")