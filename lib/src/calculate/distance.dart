import 'dart:math';

import 'package:coordinate/coordinate.dart';

double calculateLinearDistance(Coordinate start, Coordinate end) {
  final double latitudeDifference = (start.latitude - end.latitude).abs();
  final double longitudeDifference = (start.longitude - end.longitude).abs();

  final double distance =
      sqrt(pow(latitudeDifference, 2) + pow(longitudeDifference, 2));

  return distance;
}
