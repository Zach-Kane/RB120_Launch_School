module Walk
  def walk
  puts "#{name} can #{gait}"
  end
end

class Person
  include Walk

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walk
  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walk

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_accessor :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    puts "#{title} #{name} #{gait} all the time"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

puts byron.name
#=> "Byron"
puts byron.title
#=> "Lord"