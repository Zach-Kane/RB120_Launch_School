class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    #@name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
name.upcase!
puts fluffy.name
puts name

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name