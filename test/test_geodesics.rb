# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics'

class TestGeodesics < Minitest::Test
  def test_distance_radian
    strategy = Minitest::Mock.new
    exp_distance = 123
    strategy.expect(:distance, exp_distance) do |point1, point2|
      point1.latitude == 1 &&
        point1.longitude == 2 &&
        point2.latitude == 3 &&
        point2.longitude == 4
    end
    geo = Geodesics.new(strategy: strategy)
    assert_equal exp_distance, geo.distance_radian(1, 2, 3, 4)
    strategy.verify
  end

  def test_distance_degree
    strategy = Minitest::Mock.new
    exp_distance = 123
    strategy.expect(:distance, exp_distance) do |point1, point2|
      point1.latitude - to_radian(1) < 1e-10 &&
        point1.longitude - to_radian(2) < 1e-10 &&
        point2.latitude - to_radian(3) < 1e-10 &&
        point2.longitude - to_radian(4) < 1e-10
    end
    geo = Geodesics.new(strategy: strategy)
    assert_equal exp_distance, geo.distance_degree(1, 2, 3, 4)
    strategy.verify
  end

  private

  def to_radian(value)
    value * Math::PI / 180
  end
end
