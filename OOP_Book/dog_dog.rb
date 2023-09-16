class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def age
     "Nonnononon"
  end
end

Bucko = GoodDog.new("Bucko", 4)
p Bucko.age