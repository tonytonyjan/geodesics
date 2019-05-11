# frozen_string_literal: true

require 'minitest/autorun'
require 'geodesics/central_angles/vincenty'
require_relative 'shared'

class Geodesics
  module CentralAngles
    class TestVincenty < Minitest::Test
      include Shared

      attr_reader :central_angle

      def setup
        @central_angle = Vincenty.new
      end
    end
  end
end
