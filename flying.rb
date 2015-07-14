require_relative "./map"
require_relative "./airport"
require_relative "./airplane"

class Flying
  # for now all values are fixed
  def initialize
    initialize_map(width: 1, height: 20)
    initialize_airports([{x: 1, y: 5}, {x: 1, y: 22}])
    initialize_airplane(@airports.first.position)
  end

end
