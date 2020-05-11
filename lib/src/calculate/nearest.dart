import 'package:coordinate/coordinate.dart';
import 'package:coordinate/src/entity/declare.dart';

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
      _NearestCoordinateStatus(null, double.infinity);

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

T getNearestObjectByLinearDistance<T>(
  Coordinate start,
  List<T> objects,
  GetCoordinateFunction<T> getCoordinateFunction,
) {
  _NearestObjectStatus<T> status = _NearestObjectStatus(null, double.infinity);

  if (objects.length == 0) {
    return null;
  }

  for (final T object in objects) {
    final Coordinate coordinate = getCoordinateFunction(object);
    final double distance = calculateLinearDistance(start, coordinate);

    if (distance < status.distance) {
      status = _NearestObjectStatus(object, distance);
    }
  }

  return status.object;
}
