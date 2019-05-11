# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics/central_angles/spherical'
require_relative 'shared'

class Geodesics
  module CentralAngles
    class TestSpherical < Minitest::Test
      include Shared

      attr_reader :central_angle

      def setup
        @central_angle = Spherical.new
      end
    end
  end
end
