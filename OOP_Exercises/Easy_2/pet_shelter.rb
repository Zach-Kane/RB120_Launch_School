class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_accessor :owner, :pet, :records, :kennel

  def initialize
    @kennel = []
    @records = Hash.new([])
  end

  def add_kennel(pet)
    @kennel << pet
  end

  def adopt(owner, pet)
    @records[owner] += [pet]
    owner.pets << kennel.delete(pet)
    #kennel.delete(pet)
  end

  def available
    puts "Pets Still available for adoption"
    kennel.each {|pet| puts pet}
  end

  def print_adoptions
    @records.each do |key, value|
      puts "#{key.name} has adopted"
      value.each do |pet|
        puts pet
      end
      puts " "
    end
  end
end

shelter = Shelter.new

shelter.add_kennel(butterscotch = Pet.new('cat', 'Butterscotch'))
shelter.add_kennel(pudding      = Pet.new('cat', 'Pudding'))
shelter.add_kennel(darwin       = Pet.new('bearded dragon', 'Darwin'))
shelter.add_kennel(kennedy      = Pet.new('dog', 'Kennedy'))
shelter.add_kennel(sweetie      = Pet.new('parakeet', 'Sweetie Pie'))
shelter.add_kennel(molly        = Pet.new('dog', 'Molly'))
shelter.add_kennel(chester      = Pet.new('fish', 'Chester'))

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')


shelter.adopt(phanson, butterscotch)
#shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
#shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "__________"
shelter.available
p shelter.kennel[shelter.kennel.index(pudding)]