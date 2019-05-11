# frozen_string_literal: true

require 'geodesics/central_angles/haversine'

class Geodesics
  module Strategies
    class Lambert
      INVERSE_FLATTENING = 298.257223563 # WGS 84
      FLATTENING = 1.0 / INVERSE_FLATTENING
      EQUATORIAL_RADIUS = 6_378_137
      CENTRAL_ANGLE = CentralAngles::Haversine.new

      def initialize(
        equatorial_radius: EQUATORIAL_RADIUS,
        flattening: FLATTENING,
        central_angle: CENTRAL_ANGLE
      )
        @equatorial_radius = equatorial_radius
        @flattening = flattening
        @central_angle = central_angle
      end

      def distance(point1, point2)
        sigma = @central_angle.call(point1, point2)
        beta1 = parametric_latitude(point1.latitude)
        beta2 = parametric_latitude(point2.latitude)
        p = (beta1 + beta2) / 2
        q = (beta2 - beta1) / 2
        x = (sigma - sin(sigma)) * sin(p)**2 * cos(q)**2 / cos(sigma / 2)**2
        y = (sigma + sin(sigma)) * cos(p)**2 * sin(q)**2 / sin(sigma / 2)**2
        @equatorial_radius * (sigma - @flattening * (x + y) / 2)
      end

      private

      def parametric_latitude(latitude)
        Math.atan((1 - @flattening) * Math.tan(latitude))
      end

      def sin(radian)
        v = Math.sin(radian)
        v < 1e-10 ? 1e-10 : v
      end

      def cos(radian)
        v = Math.cos(radian)
        v < 1e-10 ? 1e-10 : v
      end
    end
  end
end
