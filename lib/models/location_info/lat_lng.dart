class LatLongModel {
  num? latitude;
  num? longitude;

  LatLongModel({this.latitude, this.longitude});

  factory LatLongModel.fromJson(Map<String, dynamic> json) {
    return LatLongModel(
      latitude: num.tryParse(json['latitude'].toString()),
      longitude: num.tryParse(json['longitude'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }
}
