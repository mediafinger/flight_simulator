require_relative "./test_helper"

class AirportTest < Minitest::Test
  class FirstIteration < AirportTest
    def setup
      @x = 20
      @y = 60
      @airport = Airport.new(x: @x, y: @y)
    end

    # to make this test pass, define a method 'position' on Airport
    def test_position_returns_coordinates
      assert_equal Hash(x: @x, y: @y), @airport.position
    end
  end
end
