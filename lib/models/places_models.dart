import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlacesModel({required this.id, required this.name, required this.latLng});
}

List<PlacesModel> myPlaces = [
  PlacesModel(
      id: 1,
      name: 'مشويات ابو انور',
      latLng: const LatLng(30.25382856847018, 31.162876580445413)),
  PlacesModel(
      id: 2,
      name: 'مركز شباب سندبيس ',
      latLng: const LatLng(30.256821953833693, 31.163831446802146)),
  PlacesModel(
      id: 3,
      name: 'ملعب سندبيس ',
      latLng: const LatLng(30.254375354649632, 31.162415240520264))
];
