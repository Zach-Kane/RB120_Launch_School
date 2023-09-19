class Person
  attr_reader :first
  def name=(name)
    @first = name.split[0]
    @last = name.split[1]
  end

  def name
    "#{first} #{@last}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name