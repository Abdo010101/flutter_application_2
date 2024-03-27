import 'route.dart';

class RoutesModels {
  List<RouteReoponse>? routes;

  RoutesModels({this.routes});

  factory RoutesModels.fromJson(Map<String, dynamic> json) {
    return RoutesModels(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RouteReoponse
              .fromRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME(
                  Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic>
      toRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME() {
    return {
      if (routes != null)
        'routes': routes
            ?.map((e) => e
                .toRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME())
            .toList(),
    };
  }
}
