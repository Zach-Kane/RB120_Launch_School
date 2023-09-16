# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(name)
#     @first_name = name
#   end

#   def name
#     puts "#{@first_name} #{@last_name}"
#   end

# end

# p bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    first_last(name)
  end

  def name=(name)
    first_last(name)
  end

  def name
    puts "#{@first_name} #{@last_name}"
  end

  def to_s
    name
  end

  private

  def first_last(name)
    name = name.split
    @first_name = name[0]
    @last_name = name.size == 2 ? name[1] : ' '
  end
end

# p bob = Person.new('Robert')
# bob.name                 # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob = Person.new("Robert Smith")
"The person's name is: #{bob}"

