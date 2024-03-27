import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/location_info/location_info.dart';
import 'package:flutter_application_2/models/routes_models/routes_models.dart';
import 'package:flutter_application_2/models/routes_modifiers.dart';

class RoutesService {
  final dio = Dio();
  final String baseUrl = 'YOUR API KEY ';

  final String apiKey = 'YOUR API KEY ';
  Future<RoutesModels?> fetchRoutes(
      {required LocationInfoModel origin,
      required LocationInfoModel dest,
      RoutesModifiers? routesModifiers}) async {
    Map<String, String> hearders = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
    };
    Map<String, dynamic> body = {
      "origin": origin.toJosn(),
      "destination": dest.toJosn(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routesModifiers != null
          ? routesModifiers.toJson()
          : RoutesModifiers().toJson(),
      "languageCode": "en-US",
      "units": "IMPERIAL"
    };

    try {
      return await dio
          .post(baseUrl, data: body, options: Options(headers: hearders))
          .then((value) {
        print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
        print(value.data);
        return RoutesModels.fromJson(value.data);
      });
    } catch (e) {
      print(';;pppppppppppppppppppppppppppppppppppppp');
      log(e.toString());
      return null;
    }
  }
}
