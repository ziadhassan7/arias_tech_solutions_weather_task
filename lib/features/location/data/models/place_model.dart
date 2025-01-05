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
  List<AddressComponents>? address;
  Geometry? geometry;

  Results({
    this.geometry,
    this.address,
  });

  Results.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      address = <AddressComponents>[];
      json['address_components'].forEach((v) {
        address!.add(AddressComponents.fromJson(v));
      });
    }
    geometry = json['geometry'] != null
        ? Geometry.fromJson(json['geometry'])
        : null;
  }
}

class AddressComponents {
  String? longName;
  String? shortName;

  AddressComponents({this.longName, this.shortName,});

  AddressComponents.fromJson(Map<String, dynamic> json) {
    longName = json['long_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long_name'] = longName;
    data['short_name'] = shortName;
    return data;
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
