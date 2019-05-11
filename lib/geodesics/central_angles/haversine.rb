# frozen_string_literal: true

class Geodesics
  module CentralAngles
    # https://en.wikipedia.org/wiki/Versine#Haversine
    class Haversine
      def call(point1, point2)
        2 * Math.asin(
          Math.sqrt(
            Math.sin((point1.latitude - point2.latitude).abs / 2)**2 +
            Math.cos(point1.latitude) * Math.cos(point2.latitude) *
            Math.sin((point1.longitude - point2.longitude).abs / 2)**2
          )
        )
      end
    end
  end
end
