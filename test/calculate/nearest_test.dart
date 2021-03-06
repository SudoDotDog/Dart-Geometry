import 'package:coordinate/coordinate.dart';
import 'package:test/test.dart';

import '../mock/object.dart';

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

      expect(target, Coordinate(-3, 4));
    });
  });

  group('Nearest Object Calculate', () {
    test('test nearest object calculate', () {
      final Coordinate from = Coordinate(0, 0);
      final List<MockObject> destinations = [
        createMockObject(-3, 4),
        createMockObject(4, 5),
      ];

      final MockObject target = getNearestObjectByLinearDistance(
          from, destinations, (MockObject object) => object.value);

      expect(target, createMockObject(-3, 4));
    });
  });
}
