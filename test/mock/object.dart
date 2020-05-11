import 'package:coordinate/coordinate.dart';

class MockObject {
  final Coordinate value;

  MockObject(this.value);

  bool operator ==(dynamic other) {
    return this.equals(other);
  }

  bool equals(dynamic target) {
    if (target == null) {
      return false;
    }
    return this.value == target.value;
  }
}

MockObject createMockObject(double latitude, double longitude) {
  return MockObject(Coordinate(latitude, longitude));
}
