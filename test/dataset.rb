# frozen_string_literal: true

# `dataset.sat` was downloaed from https://zenodo.org/record/32156
#
# This is a set of 500000 geodesics for the WGS84 ellipsoid; this is
# an ellipsoid of revolution with equatorial radius a = 6378137 m and
# flattening f = 1/298.257223563.
#
# Each line of the test set gives 10 space delimited numbers
#     latitude at point 1, φ1 (degrees, exact)
#     longitude at point 1, λ1 (degrees, always 0)
#     azimuth at point 1, α1 (clockwise from north in degrees, exact)
#     latitude at point 2, φ2 (degrees, accurate to 10−18 deg)
#     longitude at point 2, λ2 (degrees, accurate to 10−18 deg)
#     azimuth at point 2, α2 (degrees, accurate to 10−18 deg)
#     geodesic distance from point 1 to point 2, s12 (meters, exact)
#     arc distance on the auxiliary sphere, σ12 (degrees, accurate to 10−18 deg)
#     reduced length of the geodesic, m12 (meters, accurate to 0.1 pm)
#     the area between the geodesic and the equator, S12 (m2, accurate to 1 mm2)

Dataset = Struct.new(:latitude1, :longitude1, :azimuth1, :latitude2, :longitude2, :azimuth2, :geodesic12, :arc12, :reduced_geodesic, :area) do
  def self.each
    File.new("#{__dir__}/dataset.dat").each do |line|
      yield new(*line.split.map!(&:to_f))
    end
  end
end
