# geodesics

[![Build Status](https://travis-ci.org/tonytonyjan/geodesics.svg?branch=master)](https://travis-ci.org/tonytonyjan/geodesics)

**geodesics** calculates the geodesic distance between 2 points with latitude and longitude on ellipsoid Earth using Lambert's formula.

## Features

- It is extensible using [strategy pattern][strategy pattern]. By default:
  - Use [haversine formula][haversine] for central angle calculation.
  - Use [Lambert's formula][lambert] for
    geodesic calculation.
- The error rate is **less than 1%**. Passed a test set of [500,000 geodesics](test/dataset.dat) for the WGS84 ellipsoid.

## Installation

```
gem install geodesics
```

## Usage

### Decimal Degree as Input

```rb
require 'geodesics'
latitude1 = 22.633333
longitude1 = 120.266670
latitude2 = 25.105497
longitude2 = 121.597366
Geodesics.distance(latitude1, longitude1, latitude2, longitude2)
# => 306035.64651391446
```

- Distance unit is **meter**.
- `Geodesics#distance` is an alias of `Geodesics#distance_degree`

### Raidan as Input

```rb
Geodesics.distance_radian(latitude1, longitude1, latitude2, longitude2)
```

### Customize Strategy

```rb
class MyStrategy
  def distance(point1, point2)
    # you implementation here
  end
end
g = Geodesics.new(strategy: MyStrategy.new)
g.distance(latitude1, longitude1, latitude2, longitude2)
g.distance_radian(latitude1, longitude1, latitude2, longitude2)
```

[strategy pattern]: https://en.wikipedia.org/wiki/Strategy_pattern
[haversine]: https://en.wikipedia.org/wiki/Versine#Haversine
[lambert]: https://www.jstor.org/stable/24531873
[kristianmandrup/geo-distance]: https://github.com/kristianmandrup/geo-distance
