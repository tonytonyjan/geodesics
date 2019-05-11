# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics/point'

class Geodesics
  class TestPoint < Minitest::Test
    def test_equal
      assert_equal Point.new(1, 2), Point.new(1, 2)
      refute_equal Point.new(1, 2), Point.new(1, 3)
    end

    def test_to_radian
      assert_equal Point.new(1, 2), Point.new(1, 2).to_radian
    end

    def test_to_degree
      assert_equal Point.new(1, 2), Point.new(1, 2).to_degree
    end
  end

  class TestRadian < Minitest::Test
    def test_to_degree
      assert_equal Point.new(180, 180), Radian.new(Math::PI, Math::PI).to_degree
    end

    def test_equal
      assert_equal Radian.new(Math::PI, Math::PI), Degree.new(180, 180)
    end
  end

  class TestDegree < Minitest::Test
    def test_to_radian
      assert_equal Point.new(Math::PI, Math::PI), Degree.new(180, 180).to_radian
    end

    def test_equal
      assert_equal Radian.new(Math::PI, Math::PI), Degree.new(180, 180)
    end
  end
end
