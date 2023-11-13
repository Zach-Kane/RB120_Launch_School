=begin


if it's an integer add to register

  [stack] << value
  move second item to register if [stack] > 1 
  [register]

  7  [3,6,4]
  MULT 7 * 4 [3,6]
  28 

=end

class Minilang
  attr_accessor :args, :stack, :register

  def initialize(input)
    @args = input.split
    @stack = []
    @register = 0
  end

  def eval
    args.each do |arg|
      if arg.to_i.to_s == arg
        self.register = arg.to_i
      else
        begin
          send(arg)
        rescue NoMethodError
          puts "NoMethodError"
        end
      end
    end
  end

  def PUSH
    stack << register
  end

  def ADD
    self.register = register + stack.pop
  end

  def SUB
    self.register = register - stack.pop
  end

  def MULT
    self.register = register * stack.pop
  end

  def DIV
    self.register = register / stack.pop
  end

  def MOD
    self.register = register % stack.pop
  end

  def POP
    self.register = stack.pop
  end

  def PRINT
    puts register
  end


end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)