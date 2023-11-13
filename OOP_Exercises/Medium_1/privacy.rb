class Machine
  def stop
    self.flip_switch(:off)
  end

  def start
    self.flip_switch(:on)
  end



  def get_switch
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
p machine.get_switch