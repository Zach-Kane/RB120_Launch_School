class Cat
  attr_accessor :name, :color

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! my name is #{name} and I'm a #{color} kitty cat"
  end

  def col(c)
    self.color = c
  end

end


kitty = Cat.new('Sophie')
kitty.col("Green")
kitty.greet

