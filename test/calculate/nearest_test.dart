import 'package:coordinate/coordinate.dart';
import 'package:coordinate/src/calculate/nearest.dart';
import 'package:test/test.dart';

void main() {
  group('Nearest Calculate', () {
    test('test nearest calculate', () {
      final Coordinate from = Coordinate(0, 0);
      final List<Coordinate> destinations = [
        Coordinate(-3, 4),
        Coordinate(4, 5),
      ];

      final Coordinate target =
          getNearestCoordinateByLinearDistance(from, destinations);

      expect(target.latitude, equals(-3));
      expect(target.longitude, equals(4));
    });
  });
}
