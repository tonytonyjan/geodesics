# frozen_string_literal: true

require 'geodesics/strategies/lambert'
require 'geodesics/point'
require 'forwardable'

class Geodesics
  class << self
    extend Forwardable
    def_delegators :new, :distance, :distance_degree, :distance_radian
  end

  STRATEGY = Strategies::Lambert.new

  def initialize(strategy: STRATEGY)
    @strategy = strategy
  end

  def distance_radian(latitude1, longitude1, latitude2, longitude2)
    @strategy.distance(
      Radian.new(latitude1, longitude1),
      Radian.new(latitude2, longitude2)
    )
  end

  def distance_degree(latitude1, longitude1, latitude2, longitude2)
    @strategy.distance(
      Degree.new(latitude1, longitude1).to_radian,
      Degree.new(latitude2, longitude2).to_radian
    )
  end

  alias distance distance_degree
end
