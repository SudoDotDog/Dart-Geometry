import 'dart:math';

import 'package:coordinate/src/entity/coordinate.dart';

double calculateLinearDistance(Coordinate start, Coordinate end) {
  final double latitudeDifference = (start.latitude - end.latitude).abs();
  final double longitudeDifference = (start.longitude - end.longitude).abs();

  final double distance =
      sqrt(pow(latitudeDifference, 2) + pow(longitudeDifference, 2));

  return distance;
}

double calculateLinearDistanceWithCache(
    Map<String, double> cache, Coordinate start, Coordinate end) {
  final String parsed = "${end.latitude}:${end.longitude}";

  if (cache.containsKey(parsed)) {
    return cache[parsed];
  }

  final double latitudeDifference = (start.latitude - end.latitude).abs();
  final double longitudeDifference = (start.longitude - end.longitude).abs();

  final double distance =
      sqrt(pow(latitudeDifference, 2) + pow(longitudeDifference, 2));

  cache[parsed] = distance;
  return distance;
}
