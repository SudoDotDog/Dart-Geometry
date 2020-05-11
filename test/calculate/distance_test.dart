import 'package:coordinate/coordinate.dart';
import 'package:test/test.dart';

void main() {
  group('Distance Calculate', () {
    test('test linear distance', () {
      final Coordinate from = Coordinate(1, 1);
      final Coordinate to = Coordinate(4, 5);

      final double distance = calculateLinearDistance(from, to);

      expect(distance, equals(5));
    });

    test('test linear distance - negative', () {
      final Coordinate from = Coordinate(0, 0);
      final Coordinate to = Coordinate(-3, 4);

      final double distance = calculateLinearDistance(from, to);

      expect(distance, equals(5));
    });

    test('test linear distance - double negative', () {
      final Coordinate from = Coordinate(-1, -1);
      final Coordinate to = Coordinate(2, 3);

      final double distance = calculateLinearDistance(from, to);

      expect(distance, equals(5));
    });
  });
}
