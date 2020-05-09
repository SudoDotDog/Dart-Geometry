import 'dart:math';

import 'package:coordinate/coordinate.dart';

CoordinateRange getLinearRangeByCoordinates(List<Coordinate> coordinates) {
  double maxLatitude = -double.maxFinite;
  double minLatitude = double.maxFinite;
  double maxLongitude = -double.maxFinite;
  double minLongitude = double.maxFinite;

  for (final Coordinate coordinate in coordinates) {
    maxLatitude = max(maxLatitude, coordinate.latitude);
    minLatitude = min(minLatitude, coordinate.latitude);
    maxLongitude = max(maxLongitude, coordinate.longitude);
    minLongitude = min(minLongitude, coordinate.longitude);
  }

  return CoordinateRange(
    maxLatitude: maxLatitude,
    minLatitude: minLatitude,
    maxLongitude: maxLongitude,
    minLongitude: minLongitude,
  );
}
