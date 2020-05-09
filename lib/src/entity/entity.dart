class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate(this.latitude, this.longitude);
}

class CoordinateRange {
  final double maxLatitude;
  final double minLatitude;
  final double maxLongitude;
  final double minLongitude;

  CoordinateRange({
    this.maxLatitude,
    this.minLatitude,
    this.maxLongitude,
    this.minLongitude,
  });
}
