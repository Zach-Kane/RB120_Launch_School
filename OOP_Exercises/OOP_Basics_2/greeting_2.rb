class Cat
  def self.generic_greeting
    puts "This is a greeting"
  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hello #{name}"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting