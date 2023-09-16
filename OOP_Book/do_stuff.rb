
module YesPlease
  def please(input)
    p "#{input} please!"
  end
end

module PutStuff


  def stuff(stuff)
    puts stuff
  end

  def make_array(array)
    array.chars
  end
end


class DoStuff

  attr_accessor :poop

  def poo
    puts "Your poop is #{poop}"
  end

  def initialize(name)
    @zach = 'zach'
    @name = name
  end
  include PutStuff

  include YesPlease

  def name=(name)
    @name = name
  end

  def name
    puts @zach
  end
  def nums(input)
    input = input.to_s.chars
    input.map! {|ea| ea.to_i + 1}
  end

end


can_do = DoStuff.new("Lou")

can_do.name

can_do.name = "Larry"

can_do.poop = "corny"



p can_do.nums(123)






