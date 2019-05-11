# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics/central_angles/haversine'
require_relative 'shared'

class Geodesics
  module CentralAngles
    class TestHaversine < Minitest::Test
      include Shared

      attr_reader :central_angle

      def setup
        @central_angle = Haversine.new
      end
    end
  end
end
