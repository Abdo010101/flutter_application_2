import 'polyline.dart';

class RouteReoponse {
  num? distanceMeters;
  String? duration;
  Polyline? polyline;

  RouteReoponse({this.distanceMeters, this.duration, this.polyline});

  factory RouteReoponse.fromRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME(
      Map<String, dynamic> json) {
    return RouteReoponse(
      distanceMeters: num.tryParse(json['distanceMeters'].toString()),
      duration: json['duration']?.toString(),
      polyline: json['polyline'] == null
          ? null
          : Polyline
              .fromRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME(
                  Map<String, dynamic>.from(json['polyline'])),
    );
  }

  Map<String, dynamic>
      toRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME() {
    return {
      if (distanceMeters != null) 'distanceMeters': distanceMeters,
      if (duration != null) 'duration': duration,
      if (polyline != null)
        'polyline': polyline
            ?.toRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME(),
    };
  }
}
