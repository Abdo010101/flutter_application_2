import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/location_info/lat_lng.dart';
import 'package:flutter_application_2/models/location_info/location.dart';
import 'package:flutter_application_2/models/location_info/location_info.dart';
import 'package:flutter_application_2/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:flutter_application_2/utils/Loaction_Service.dart';
import 'package:flutter_application_2/utils/places_service.dart';
import 'package:flutter_application_2/utils/routes_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsService {
  RoutesService routeService = RoutesService();
  PlacesService placesService = PlacesService();
  LocatoinService locatoinService = LocatoinService();

  Future<List<PlaceAutocompleteModel>> getPerdictions(
      {required TextEditingController input,
      required String sesionToken,
      required List<PlaceAutocompleteModel> places}) async {
    if (input.text.isNotEmpty) {
      var res = await placesService.getPerdictions(
          seesionToken: sesionToken, input: input.text.toString());

      places = [];
      places.addAll(res!);
      print(';ddddddddddddddddd');
      print(places.length);
      return places;
      // setState(() {});
    } else {
      places = [];
      return places;
      // setState(() {});
    }
  }

  Future<List<LatLng>> getRouteData(
      {required LatLng myLocation, required LatLng destination}) async {
    LocationInfoModel origin = LocationInfoModel(
        location: LocationModel(
            latLng: LatLongModel(
                latitude: myLocation.latitude,
                longitude: myLocation.longitude)));

    LocationInfoModel dest = LocationInfoModel(
        location: LocationModel(
            latLng: LatLongModel(
                latitude: destination.latitude,
                longitude: destination.longitude)));

    PolylinePoints polylinePoints = PolylinePoints();
    var routes = await routeService.fetchRoutes(origin: origin, dest: dest);
    List<PointLatLng> result = polylinePoints
        .decodePolyline(routes!.routes!.first.polyline!.encodedPolyline!);
    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    //setState(() {});
    return points;
  }

  void displayRoute(List<LatLng> poinst,
      {required GoogleMapController googleMapController,
      required Set<Polyline> polyLine}) {
    Polyline route = Polyline(
        color: Colors.blue,
        width: 5,
        polylineId: PolylineId('first Route'),
        points: poinst);
    polyLine.clear();
    polyLine.add(route);

    LatLngBounds bounds = getLatLngBounds(poinst);
    googleMapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 20));
    //setState(() {});
  }

  LatLngBounds getLatLngBounds(List<LatLng> poinst) {
    var southEastLat = poinst.first.latitude;
    var southEastLng = poinst.first.longitude;
    var northEastLat = poinst.first.latitude;
    var northEastLng = poinst.first.longitude;
    for (var item in poinst) {
      southEastLat = min(item.latitude, southEastLat);
      southEastLng = min(item.longitude, southEastLng);
      northEastLat = max(item.latitude, northEastLat);

      northEastLng = max(item.latitude, northEastLng);
    }
    return LatLngBounds(
        southwest: LatLng(southEastLat, southEastLng),
        northeast: LatLng(northEastLat, northEastLng));
  }

  Future<LatLng> updateCurrentLocation(
      {required GoogleMapController googleMapController,
      required Set<Marker> myMarker}) async {
    var locationData = await locatoinService.getMyLoaction();
    // i want to move the camera into new location we want to create google map controller
    var myLocation = LatLng(locationData.latitude!, locationData.longitude!);
    updataCameraPostionToMyLocatin(myLocation,
        googleMapController: googleMapController);
    setMarkerToMyLocation(myLocation, myMarker: myMarker);
    // setState(() {});
    return myLocation;
  }

  void updataCameraPostionToMyLocatin(LatLng latLng,
      {required GoogleMapController googleMapController}) {
    CameraPosition myCurrentLocationPostion =
        CameraPosition(target: latLng, zoom: 13);
    googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationPostion));
  }

  void setMarkerToMyLocation(LatLng latLng, {required Set<Marker> myMarker}) {
    Marker myLocationMarker =
        Marker(markerId: const MarkerId('my Location'), position: latLng);
    myMarker.add(myLocationMarker);
  }
}
