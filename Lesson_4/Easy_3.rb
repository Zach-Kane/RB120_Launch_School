class Greeting
  def greet(message)
    puts message
  end
end

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

willy = AngryCat.new(12, 'willy')
rufus = AngryCat.new(13, 'rufus')
p willy
p rufus


class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "Iam a #{@type} cat"
  end
end

cat = Cat.new("fluffy")

puts cat