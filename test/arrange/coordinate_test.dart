import 'package:coordinate/coordinate.dart';
import 'package:test/test.dart';

import '../mock/object.dart';

void main() {
  group('Arrange Coordinate', () {
    test('test arrange coordinate', () {
      final Coordinate start = Coordinate(0, 0);
      final List<Coordinate> destinations = [
        Coordinate(-2, -2),
        Coordinate(3, 4),
        Coordinate(2, 3),
        Coordinate(4, 5),
        Coordinate(8, 8),
        Coordinate(1, 2),
      ];

      final List<Coordinate> result = arrangeCoordinateByLinearDistance(
        start,
        destinations,
      );

      expect(result[0], equals(destinations[5]));
      expect(result[1], equals(destinations[2]));
      expect(result[2], equals(destinations[1]));
      expect(result[3], equals(destinations[3]));
      expect(result[4], equals(destinations[4]));
      expect(result[5], equals(destinations[0]));
    });
  });

  group('Arrange Object', () {
    test('test arrange object', () {
      final Coordinate start = Coordinate(0, 0);
      final List<MockObject> destinations = [
        createMockObject(-2, -2),
        createMockObject(3, 4),
        createMockObject(2, 3),
        createMockObject(4, 5),
        createMockObject(8, 8),
        createMockObject(1, 2),
      ];

      final List<MockObject> result = arrangeObjectByLinearDistance(
        start,
        destinations,
        (MockObject object) => object.value,
      );

      expect(result[0], equals(destinations[5]));
      expect(result[1], equals(destinations[2]));
      expect(result[2], equals(destinations[1]));
      expect(result[3], equals(destinations[3]));
      expect(result[4], equals(destinations[4]));
      expect(result[5], equals(destinations[0]));
    });
  });
}
