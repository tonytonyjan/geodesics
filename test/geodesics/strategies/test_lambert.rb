# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics/strategies/lambert'
require 'geodesics/point'
require_relative '../../dataset'

class Geodesics
  module Strategies
    class TestLambert < Minitest::Test
      def test_distance
        lambert = Lambert.new
        Dataset.each do |dataset|
          exp = dataset.geodesic12
          act = lambert.distance(
            Degree.new(dataset.latitude1, dataset.longitude1).to_radian,
            Degree.new(dataset.latitude2, dataset.longitude2).to_radian
          )
          assert_in_delta exp, act, exp * 0.01
        end
      end
    end
  end
end
