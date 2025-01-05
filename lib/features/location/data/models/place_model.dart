import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';

class PlaceModel {
  List<Results>? results;

  PlaceModel({this.results,});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  Geometry? geometry;

  Results({
    this.geometry,
  });

  Results.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'] != null
        ? Geometry.fromJson(json['geometry'])
        : null;
  }
}

class Geometry {
  LatLong? latLong;

  Geometry({this.latLong,});

  Geometry.fromJson(Map<String, dynamic> json) {
    latLong = json['location'] != null
        ? LatLong.fromJson(json['location'])
        : null;
  }
}
