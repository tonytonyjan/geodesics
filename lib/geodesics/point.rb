# frozen_string_literal: true

class Geodesics
  class Point
    RADIAN = Math::PI / 180
    DEGREE = 180 / Math::PI

    attr_reader :latitude, :longitude

    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def ==(other)
      latitude == other.latitude && longitude == other.longitude
    end

    def to_radian
      self
    end

    def to_degree
      self
    end
  end

  class Radian < Point
    def to_degree
      Degree.new(@latitude * DEGREE, @longitude * DEGREE)
    end

    def ==(other)
      other.is_a?(Degree) ? super(other.to_radian) : super
    end
  end

  class Degree < Point
    def to_radian
      Radian.new(@latitude * RADIAN, @longitude * RADIAN)
    end

    def ==(other)
      other.is_a?(Radian) ? super(other.to_degree) : super
    end
  end
end
