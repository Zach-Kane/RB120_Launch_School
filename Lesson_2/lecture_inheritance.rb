# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "I can't swim!"
#   end
# end


# teddy = Dog.new
# rufus = Bulldog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# puts rufus.swim

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Cat < Animal
  def speak
    'Meow meow'
  end
end

pete = Animal.new
kitty = Cat.new
dave = Dog.new
#bud = Bulldog.new

pete.run                # => "running!"
pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"