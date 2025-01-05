class LatLong {
  final double lat;
  final double long;

  const LatLong({required this.lat, required this.long});

  factory LatLong.fromJson(Map<String, dynamic> json) {
    return LatLong(
      lat: json['lat'] as double,
      long: json['lng'] as double,
    );
  }
}