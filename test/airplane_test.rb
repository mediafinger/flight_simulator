require_relative "./test_helper"

class AirplaneTest < Minitest::Test
  class FirstIteration < AirplaneTest
    def setup
      @x        = 20
      @y        = 60
      @flying   = false
      @speed    = 0
      @fuel     = 200
      @airplane = Airplane.new(x: @x, y: @y, flying: @flying, speed: @speed, fuel: @fuel)
    end

    # to make this test pass, define a method 'position' on Airplane
    def test_position_returns_coordinates
      assert_equal Hash(x: @x, y: @y), @airplane.position
    end

    def test_flying_is_set
      assert_equal @flying, @airplane.flying
    end

    def test_fuel_is_set
      assert_equal @fuel, @airplane.fuel
    end

    def test_speed_is_set
      assert_equal @speed, @airplane.speed
    end

    def test_speed_can_not_be_set_directly
      # here we expect that an Error is raised
      # when we execute the block in { }
      assert_raises(NoMethodError) { @airplane.speed = 5 }
    end

    def test_speed_can_not_be_negative
      @airplane.set_speed(-1)
      assert_equal 0, @airplane.speed
    end

    def test_speed_can_not_be_larger_than_10
      @airplane.set_speed(100)
      assert_equal 10, @airplane.speed
    end

    def test_accelerate
      @airplane.accelerate
      assert_equal 2, @airplane.speed
    end

    def test_slow_down
      @airplane.set_speed(5)

      @airplane.slow_down
      assert_equal 4, @airplane.speed
    end

    def test_take_off
      @airplane.take_off
      assert @airplane.flying
      assert_equal 2, @airplane.speed
    end

    def test_touchdown
      @airplane.take_off
      @airplane.set_speed(1)

      @airplane.touchdown
      assert !@airplane.flying
      assert_equal 0, @airplane.speed
    end
  end

  class SecondIteration < AirplaneTest
    def setup
      @x        = 20
      @y        = 60
      @flying   = false
      @speed    = 0
      @fuel     = 200
      @airplane = Airplane.new(x: @x, y: @y, flying: @flying, speed: @speed, fuel: @fuel)
    end

    def test_airplane_is_not_crashed
      assert !@airplane.crashed
    end

    def test_grounded
      assert_equal !@flying, @airplane.grounded
    end

    def set_position
      @airplane.set_speed(5)
      @airplane.set_position
      # we don't change x yet, we only fly 'north'
      assert_equal Hash(x: @x, y: @y + 5), @airplane.position
    end

    # to make this test pass, let every method return 'self'
    def test_commands_can_be_chained
      assert_equal @airplane, @airplane.take_off.accelerate.slow_down.slow_down.touchdown
    end

    # to make this test pass, let every method return 'self'
    def test_consume_fuel_in_relation_to_speed
      assert_equal @fuel - 5, @airplane.set_speed(5).consume_fuel.fuel
    end

    def test_status
      assert_equal "initialized", @airplane.status
    end

    def test_fly_with_airplane_on_ground
      assert_equal "Grounded at {:x=>20, :y=>60}", @airplane.fly.status
    end

    def test_fly
      @airplane.take_off.set_speed(5)
      assert_equal "Flying at {:x=>20, :y=>65}", @airplane.fly.status
      assert_equal @fuel - 5, @airplane.fuel
    end
  end
end
