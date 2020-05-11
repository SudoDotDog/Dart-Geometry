import 'package:coordinate/coordinate.dart';

List<Coordinate> sortCoordinateByLinearDistance(
    Coordinate start, List<Coordinate> destinations) {
  final List<Coordinate> clone = destinations.toList();

  clone.sort((Coordinate a, Coordinate b) {
    final double aDistance = calculateLinearDistance(start, a);
    final double bDistance = calculateLinearDistance(start, b);

    if (aDistance > bDistance) {
      return 1;
    } else if (aDistance < bDistance) {
      return -1;
    }
    return 0;
  });

  return clone;
}
