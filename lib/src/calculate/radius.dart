
import 'dart:math';

import 'package:geometry/src/entity/entity.dart';

const double ANGLE = 180.0;
const double EARTH_RADIUS = 6378.137;

double calculateRadiusRange(double distance) {

    return (distance * pi) / ANGLE;
}

double calculateRadiusDistance(Coordinate from, Coordinate to, {
  int precision = 3,
}) {

    const radiusFromLatitude: number = calculateRadiusRange(from.latitude);
    const radiusFromLongitude: number = calculateRadiusRange(from.longitude);

    const radiusToLatitude: number = calculateRadiusRange(to.latitude);
    const radiusToLongitude: number = calculateRadiusRange(to.longitude);

    const radiusLatitudeDifference: number = radiusFromLatitude - radiusToLatitude;
    const radiusLongitudeDifference: number = radiusFromLongitude - radiusToLongitude;

    const latitudeDifference: number = Math.pow(Math.sin(radiusLatitudeDifference / 2), 2);
    const longitudeDifference: number = Math.pow(Math.sin(radiusLongitudeDifference / 2), 2);

    const extensionDifference: number = Math.cos(radiusFromLatitude) * Math.cos(radiusToLatitude);

    const radiusCombinedDifference: number = 2 * Math.asin(Math.sqrt(latitudeDifference + extensionDifference * longitudeDifference));

    const curvedDistance: number = radiusCombinedDifference * EARTH_RADIUS;

    const roundPrecision: number = Math.pow(10, precision);
    const rounded: number = Math.round(curvedDistance * roundPrecision) / roundPrecision;

    return rounded;
};

export const calculateRadiusDistanceInMeter = (from: Coordinate, to: Coordinate, precision: number = 2): number => {

    const distanceInKilometer: number = calculateRadiusDistance(from, to, 3 + precision);
    const distanceInMeter: number = distanceInKilometer * 1000;

    return distanceInMeter;
};
