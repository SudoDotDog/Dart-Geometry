import 'package:coordinate/coordinate.dart';

class MockObject {
  final Coordinate value;

  MockObject(this.value);
}

MockObject createMockObject(double latitude, double longitude) {
  return MockObject(Coordinate(latitude, longitude));
}
