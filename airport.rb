class Airport
  def initialize(x:, y:)
    @x  = x
    @y = y
  end

  # @x and @y are not accessible from outside the class, we only reveal the method 'position'
  def position
    { x: @x, y: @y }
  end
end
