import 'location.dart';

class LocationInfoModel {
  LocationModel? location;

  LocationInfoModel({this.location});

  factory LocationInfoModel.fomJson(Map<String, dynamic> json) {
    return LocationInfoModel(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(Map<String, dynamic>.from(json['location'])),
    );
  }

  Map<String, dynamic> toJosn() {
    return {
      if (location != null) 'location': location?.toJson(),
    };
  }
}
