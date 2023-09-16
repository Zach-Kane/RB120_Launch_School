module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal
  def poop
    "i can poop!"
  end
end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

p sparky.swim                 # => I'm swimming!
p neemo.swim                  # => I'm swimming!
p paws.poop              # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>