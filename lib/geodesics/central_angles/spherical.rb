# frozen_string_literal: true

class Geodesics
  module CentralAngles
    # https://en.wikipedia.org/wiki/Spherical_law_of_cosines
    class Spherical
      def call(point1, point2)
        Math.acos(
          Math.sin(point1.latitude) * Math.sin(point2.latitude) +
          Math.cos(point1.latitude) * Math.cos(point2.latitude) *
          Math.cos((point1.longitude - point2.longitude).abs)
        )
      end
    end
  end
end
