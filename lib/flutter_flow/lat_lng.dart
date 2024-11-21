import 'dart:math';

class LatLng {
  const LatLng(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  @override
  String toString() => 'LatLng(lat: $latitude, lng: $longitude)';

  String serialize() => '$latitude,$longitude';

  @override
  int get hashCode => latitude.hashCode + longitude.hashCode;

  @override
  bool operator ==(other) => other is LatLng && latitude == other.latitude && longitude == other.longitude;

  double distanceFrom(LatLng other) {
    return sqrt(pow(longitude - other.longitude, 2) + pow(latitude - other.latitude, 2));
  }
}
