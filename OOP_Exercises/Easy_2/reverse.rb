class Transform
  def initialize(words)
    @words = words
  end

  def uppercase
    @words.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')