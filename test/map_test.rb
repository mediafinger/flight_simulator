require_relative "./test_helper"

class MapTest < Minitest::Test
  class FirstIteration < MapTest
    def setup
      @width  = 60
      @height = 60
      @map    = Map.new(width: @width, height: @height)
    end

    def test_height_is_set
      assert_equal @height, @map.height
    end

    def test_width_is_set
      assert_equal @width, @map.width
    end
  end
end
