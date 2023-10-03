class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors

=begin
The @@cats_count variable keeps a count of the number of times a Cat object is instantiated. When a new Cat object is created the initialize method is called and the @@cats_count += 1 increments by one. We can call the class method #cats_count to find the value of the @@cats_count class variable.

=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

fluffy = Cat.new('furball')
p fluffy
puts Cat.cats_count