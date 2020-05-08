import 'dart:math';

import 'package:geometry/src/entity/entity.dart';

const double ANGLE = 180.0;
const double EARTH_RADIUS = 6378.137;

double calculateRadiusRange(double distance) {
  return (distance * pi) / ANGLE;
}

double calculateRadiusDistance(
  Coordinate from,
  Coordinate to, {
  int precision = 3,
}) {
  final double radiusFromLatitude = calculateRadiusRange(from.latitude);
  final double radiusFromLongitude = calculateRadiusRange(from.longitude);

  final double radiusToLatitude = calculateRadiusRange(to.latitude);
  final double radiusToLongitude = calculateRadiusRange(to.longitude);

  final double radiusLatitudeDifference = radiusFromLatitude - radiusToLatitude;
  final double radiusLongitudeDifference =
      radiusFromLongitude - radiusToLongitude;

  final double latitudeDifference = pow(sin(radiusLatitudeDifference / 2), 2);
  final double longitudeDifference = pow(sin(radiusLongitudeDifference / 2), 2);

  final double extensionDifference =
      cos(radiusFromLatitude) * cos(radiusToLatitude);

  final double radiusCombinedDifference = 2 *
      asin(
        sqrt(latitudeDifference + extensionDifference * longitudeDifference),
      );

  final double curvedDistance = radiusCombinedDifference * EARTH_RADIUS;

  final double roundPrecision = pow(10, precision);
  final double rounded =
      (curvedDistance * roundPrecision).round() / roundPrecision;

  return rounded;
}

double calculateRadiusDistanceInMeter(
  Coordinate from,
  Coordinate to, {
  int precision = 3,
}) {
  final double distanceInKilometer = calculateRadiusDistance(
    from,
    to,
    precision: 3 + precision,
  );
  final double distanceInMeter = distanceInKilometer * 1000;

  return distanceInMeter;
}
