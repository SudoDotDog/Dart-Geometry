import 'package:coordinate/coordinate.dart';

List<Coordinate> arrangeCoordinateByLinearDistance(
    Coordinate start, List<Coordinate> destinations) {
  final Set<Coordinate> destinationsSet = new Set();

  for (final Coordinate destination in destinations) {
    destinationsSet.add(destination);
  }

  final List<Coordinate> result = [];

  while (destinationsSet.length > 0) {}

  return result;
}
