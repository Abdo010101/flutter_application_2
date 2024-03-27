import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'lat_lng.dart';

class LocationModel {
  LatLongModel? latLng;

  LocationModel({this.latLng});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latLng: json['latLng'] == null
          ? null
          : LatLongModel.fromJson(Map<String, dynamic>.from(json['latLng'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (latLng != null) 'latLng': latLng?.toJson(),
    };
  }
}
