import 'package:flutter_test/flutter_test.dart';
import 'package:geometry/geometry.dart';

void main() {
  group('Radius Calculate', () {
    test('test radius calculate', () {
      final Coordinate from = Coordinate(1, 1);
      final Coordinate to = Coordinate(4, 5);

      final double distance = calculateRadiusDistance(from, to);

      expect(distance, equals(556.217));
    });

    test('test radius calculate - negative', () {
      final Coordinate from = Coordinate(40, -73);
      final Coordinate to = Coordinate(58, 3);

      final double distance = calculateRadiusDistance(from, to);

      expect(distance, equals(5561.532));
    });

    test('test radius calculate - in meter', () {
      final Coordinate from = Coordinate(1, 1);
      final Coordinate to = Coordinate(4, 5);

      final double distance = calculateRadiusDistanceInMeter(from, to);

      expect(distance, equals(556217.45));
    });
  });
}
