import 'package:coordinate/coordinate.dart';
import 'package:coordinate/src/entity/coordinate.dart';
import 'package:coordinate/src/entity/declare.dart';

List<Coordinate> arrangeCoordinateByLinearDistance(
  Coordinate start,
  List<Coordinate> destinations,
) {
  final Set<Coordinate> destinationsSet = new Set();

  for (final Coordinate destination in destinations) {
    destinationsSet.add(destination);
  }
  final List<Coordinate> result = [];

  while (destinationsSet.length > 0) {
    final Coordinate currentStart =
        result.length == 0 ? start : result[result.length - 1];
    final Coordinate next = getNearestCoordinateByLinearDistance(
      currentStart,
      destinationsSet.toList(),
    );

    if (next != null) {
      result.add(next);
      destinationsSet.remove(next);
    } else {
      return result;
    }
  }

  return result;
}

List<T> arrangeObjectByLinearDistance<T>(
  Coordinate start,
  List<T> objects,
  GetCoordinateFunction<T> getCoordinateFunction,
) {
  final Set<T> objectSet = new Set();

  for (final T object in objects) {
    objectSet.add(object);
  }
  final List<T> result = [];

  while (objects.length > 0) {
    final Coordinate currentStart = result.length == 0
        ? start
        : getCoordinateFunction(result[result.length - 1]);
    final T next = getNearestObjectByLinearDistance(
      currentStart,
      objectSet.toList(),
      getCoordinateFunction,
    );

    if (next != null) {
      result.add(next);
      objectSet.remove(next);
    } else {
      return result;
    }
  }

  return result;
}
