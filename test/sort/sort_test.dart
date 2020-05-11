import 'package:coordinate/coordinate.dart';
import 'package:test/test.dart';

void main() {
  group('Sort Coordinate', () {
    test('test sort coordinate', () {
      final Coordinate start = Coordinate(0, 0);
      final List<Coordinate> destinations = [
        Coordinate(1, 1),
        Coordinate(5, 3),
        Coordinate(0, 0),
        Coordinate(2, 1),
        Coordinate(0, -1),
      ];

      final List<Coordinate> result = sortCoordinateByLinearDistance(
        start,
        destinations,
      );

      expect(result[0], equals(destinations[2]));
      expect(result[1], equals(destinations[4]));
      expect(result[2], equals(destinations[0]));
      expect(result[3], equals(destinations[3]));
      expect(result[4], equals(destinations[1]));
    });
  });
}
