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
  });
}
