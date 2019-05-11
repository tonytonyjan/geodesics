# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'geodesics'
  spec.version = '1.0.0'
  spec.licenses = ['MIT']
  spec.summary = "#{spec.name} calculates the geodesic distance between 2 points with latitude and longitude on ellipsoid Earth using Lambert's formula."
  spec.description = "#{spec.name} calculates the geodesic distance between 2 points with latitude and longitude on ellipsoid Earth using Lambert's formula."
  spec.author = 'Jian Weihang'
  spec.files = Dir['lib/**/*.rb']
  spec.email = 'tonytonyjan@gmail.com'
  spec.homepage = 'https://github.com/tonytonyjan/geodesics'
  spec.add_development_dependency 'minitest', '~> 5.11.3'
  spec.add_development_dependency 'rake', '~> 12.3.2'
  spec.add_development_dependency 'rubocop', '~> 0.68.1'
end
