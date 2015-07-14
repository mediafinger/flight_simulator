require_relative "./test_helper"

class FlyingTest < Minitest::Test
  class SecondIteration < FlyingTest
    def setup
      @flying   = Flying.new
      @commands = %w(
        take_off
        accelerate
        keep_going
        slow_down
        slow_down
        slow_down
        keep_going
        touchdown
      )
    end

    def test_airplane_safe
      assert_equal "It is safe on the ground.", @flying.fly(@commands)
    end

    def test_position_last_is_different_from_position_start
      # TODO
    end
  end
end
