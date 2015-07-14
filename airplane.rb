class Airplane
  attr_accessor :crashed
  attr_reader :flying, :speed, :fuel, :status
    # this syntax is used to define 'required parameters' aka 'required keyword arguments'
  def initialize(x:, y:, flying: false, speed: 0, fuel: 500)
    @x      = x
    @y      = y
    @flying = flying
    @fuel   = fuel
    set_speed(speed)
    @crashed = false
    @status  = "initialized"
  end

  def fly
    if @flying
      consume_fuel.set_position
      @status = "Flying at #{position}"
    else
      @status = "Grounded at #{position}"
    end
    self
  end

  def grounded
    !flying
  end

  def position
    { x: @x, y: @y }
  end

  def set_position
    @x = @x         # not changed yet
    @y = @y + speed # our plane flys only 'north'
    self
  end

  def set_speed(new_speed)
    # these two lines ensure that speed is between 0 and 10
    # feel free to refactor them to work and look like you want
    new_speed = [0, new_speed].max
    new_speed = [new_speed, 10].min

    # this should be the only method that sets @speed,
    # otherwise the validations are not used
    @speed = new_speed
    self
  end

  def accelerate
    set_speed(speed + 2)
  end

  def slow_down
    set_speed(speed - 1)
  end

  def take_off
    accelerate
    @flying = true
    self
  end

  def touchdown
    slow_down
    @flying = false
    self
  end

  def consume_fuel
    @fuel = [fuel - speed, 0].max
    self
  end
end
