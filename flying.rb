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

  def fly(commands)
    puts "The Map is #{@map.width} x #{@map.height} fields large."
    puts "The starting Airport is at #{@airports.first.position}."
    puts "The destination Airport is at #{@airports.last.position}."

    if @airplane.crashed
      return puts "The plane crashed #{@airplane}"
    end

    commands.each do |command|
      @airplane.public_send(command) unless command == "keep_going"
      @airplane.fly

      if @airplane.grounded && !over_airport(@airplane)
        @airplane.crashed = true
        puts "CRASHED"
        break
      end
    end

    puts "The plane is at #{@airplane.position}"
    "It is safe on the ground." if @airplane.grounded && over_airport(@airplane)
  end

  private

  def over_airport(airplane)
    (@airports.map(&:position).include? airplane.position)
  end

  def initialize_map(width:, height:)
    @map = Map.new(width: width, height: height)
  end

  # ensure the positions are on the Map!
  def initialize_airports(positions)
    @airports = []

    positions.each do |position|
      @airports << Airport.new(position)
    end
  end

  # ensure the airplane starts on an airport!
  def initialize_airplane(position)
    @airplane = Airplane.new(x: position[:x], y: position[:y], flying: false, speed: 0, fuel: 200)
  end
end
