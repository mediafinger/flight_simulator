class Map
  # this makes the attributes accessible from the outside of this class
  # and it makes them accessible without the '@' from the inside of the class
  attr_reader :width, :height

  # this syntax is used to define 'required parameters' aka 'required keyword arguments'
  def initialize(width:, height:)
    @width  = width
    @height = height
  end
end
