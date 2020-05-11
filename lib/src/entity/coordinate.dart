class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate(this.latitude, this.longitude);

  bool operator ==(dynamic other) {
    return this.equals(other);
  }

  bool equals(dynamic target) {
    if (target == null) {
      return false;
    }
    return target.latitude == this.latitude &&
        target.longitude == this.longitude;
  }
}
