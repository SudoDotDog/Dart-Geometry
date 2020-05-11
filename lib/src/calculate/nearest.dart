import 'package:coordinate/coordinate.dart';

class _NearestCoordinateStatus {
  final Coordinate coordinate;
  final double distance;

  _NearestCoordinateStatus(this.coordinate, this.distance);
}

class _NearestObjectStatus<T> {
  final T object;
  final double distance;

  _NearestObjectStatus(this.object, this.distance);
}

Coordinate getNearestCoordinateByLinearDistance(
    Coordinate start, List<Coordinate> destinations) {
  _NearestCoordinateStatus status =
      _NearestCoordinateStatus(null, -double.infinity);

  if (destinations.length == 0) {
    return null;
  }

  for (final Coordinate destination in destinations) {
    final double distance = calculateLinearDistance(start, destination);

    if (distance < status.distance) {
      status = _NearestCoordinateStatus(destination, distance);
    }
  }

  return status.coordinate;
}
