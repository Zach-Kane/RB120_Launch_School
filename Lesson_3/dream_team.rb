class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = niners + cowboys
puts dream_team.inspect                     # => #<Team:0x007fac3b9eb878 @name="Temporary Team" ...

puts "More methods...."
# assume set up from earlier
p cowboys.members                           # => ... array of 3 Person objects

p cowboys[1]                                # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
p cowboys[3] = Person.new("JJ", 72)
p cowboys[3]                                # => #<Person:0x007fae9220fa88 @name="JJ", @age=72>