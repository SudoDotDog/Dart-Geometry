import 'package:numeric/numeric.dart';

class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate(this.latitude, this.longitude);

  factory Coordinate.fromLatLngMap(Map<String, dynamic> map) {
    return Coordinate(
      tryParseNullDouble(map['lat']),
      tryParseNullDouble(map['lng']),
    );
  }

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
