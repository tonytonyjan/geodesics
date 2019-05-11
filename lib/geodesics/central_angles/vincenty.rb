# frozen_string_literal: true

class Geodesics
  module CentralAngles
    # https://en.wikipedia.org/wiki/Vincenty%27s_formulae
    class Vincenty
      def call(point1, point2)
        delta_longitude = (point1.longitude - point2.longitude).abs
        Math.atan(
          Math.sqrt(
            (Math.cos(point2.latitude) * Math.sin(delta_longitude))**2 +
            (Math.cos(point1.latitude) * Math.sin(point2.latitude) - Math.sin(point1.latitude) * Math.cos(point2.latitude) * Math.cos(delta_longitude))**2
          ) / (
            Math.sin(point1.latitude) * Math.sin(point2.latitude) +  Math.cos(point1.latitude) * Math.cos(point2.latitude) * Math.cos(delta_longitude)
          )
        )
      end
    end
  end
end
