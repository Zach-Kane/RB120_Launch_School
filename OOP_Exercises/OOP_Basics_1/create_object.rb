module Walkabale
  def walk
    puts "Let's go for a walk"
  end
end



class Cat
  include Walkabale

  attr_accessor :name

  def initialize(name)
    puts "I'm a cat"
    @name = name
  end

  def greet
    puts "Hello I'm #{name}"
  end

end

kitty = Cat.new("Sphinx")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk
