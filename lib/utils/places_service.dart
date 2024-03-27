import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/near_by_places_model/near_by_places_model.dart';
import 'package:flutter_application_2/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:flutter_application_2/models/place_detail_model/place_detail_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesService {
  final dio = Dio();
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyCp0KTKCmko_TOhjj7x6BL5X8xhXPEshds';

  Future<List<PlaceAutocompleteModel>?> getPerdictions(
      {required String input, required String seesionToken}) async {
    List<PlaceAutocompleteModel> places = [];
    try {
      var response = await dio.get('$baseUrl/autocomplete/json',
          queryParameters: {
            'input': input,
            'key': apiKey,
            'sessiontoken': seesionToken
          }).then((value) {
        print('sdfsdfs');
        print(value.data['predictions']);

        for (var item in value.data['predictions']) {
          places.add(PlaceAutocompleteModel.fromJson(item));
        }
      });
      print('inside the server');
      print(places.length);
      print(places[0].description);
      return places;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<PlaceDetailModel?> getPlaceDetails(String placeId) async {
    try {
      return await dio.get('$baseUrl/details/json',
          queryParameters: {'place_id': placeId, 'key': apiKey}).then((value) {
        print('sfasdfsadf');
        print(value.data['result']);
        return PlaceDetailModel.fromJson(value.data['result']);
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //! get nearby places that i want form my location (myLocation ,apikey,keyword ,Raduis in meter ,type but type not equal to keywork)

  Future<NearByPlacesModel?> getNearbyPlaces(
      {String keyWord = 'ATMs',
      String type = 'resturant',
      int raduis = 1500000,
      required String location}) async {
    Map<String, dynamic> queryParmeters = {
      'type': type,
      'keyword': keyWord,
      'radius': raduis,
      'key': apiKey,
      'location': location
    };

    try {
      return await dio
          .get('${baseUrl}/nearbysearch/json', queryParameters: queryParmeters)
          .then((value) {
        print('i am in nearbyyyyyyyyyyyyyyyyyyyyyyyyyy');
        print(value.data);
        return NearByPlacesModel.fromJson(value.data);
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
