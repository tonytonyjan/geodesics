# frozen_string_literal: true

require 'geodesics/point'

class Geodesics
  module CentralAngles
    module Shared
      def test_central_angle
        assert_central_angle 1.39674062, [0, 1], [2, 3]
        assert_central_angle 1.22245061, [3, 2], [1, 0]
        assert_central_angle 1.30170541, [1.1, 2.2], [3.1, 0.1]
        assert_central_angle 0.2797714, [0.1, 0.2], [0.3, 0.4]
      end

      private

      def assert_central_angle(exp, point1, point2)
        assert_in_delta exp, central_angle.call(Point.new(*point1), Point.new(*point2)), 0.000001
      end
    end
  end
end
