import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/places_models.dart';
import 'package:flutter_application_2/utils/Loaction_Service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:location/location.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late CameraPosition initalCameraPositon;
  late CameraTargetBounds initalCameraTargeBounds;
  GoogleMapController? googleMapController;
  late String? _mapStyle;
  late LocatoinService locatoinService;

  var isFirstCall = true;
  //* why we use set becasue set is uniqure every row insideit uinque
  Set<Marker> myMarker = {};
  Set<Polyline> myPolyLines = {};
  Set<Polygon> myPolygones = {};
  Set<Circle> myCircles = {};

  @override
  void initState() {
    locatoinService = LocatoinService();
    initalCameraPositon = const CameraPosition(
        zoom: 1, target: LatLng(30.25531977978793, 31.164440253622903));

    // initalCameraTargeBounds = CameraTargetBounds(LatLngBounds(
    //     northeast: const LatLng(30.26783779052661, 31.186771513480956),
    //     southwest: const LatLng(30.248057887021364, 31.16036062027853)));
    initStyleGoolgMap();

    updateLocation();

    // // to add marker you must but it in initestate
    // initMakeMarker();
    // // to add PolyLines lines in maps
    // initPolyLines();
    // // to add Polygones shap in map
    // initPolyGones();
    // // to add Circule in sepecpic point
    // initCircle();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            zoomControlsEnabled: false,
            //* why marker is set because is uniuque each building have a unique marker /
            markers: myMarker,
            //* we have polyLines between two positons we draw line between two lines
            polylines: myPolyLines,
            //* we have polygons to draw two diemntional shap
            polygons: myPolygones,

            ///* circule we want to draw circule
            circles: myCircles,
            // mapType: MapType.satellite,
            //** if i want to bound the specfic area in map what should i do */
            /// cameraTargetBounds: initalCameraTargeBounds,
            onMapCreated: (controller) {
              googleMapController = controller;
            },
            style: _mapStyle,
            initialCameraPosition: initalCameraPositon),
        Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton(
                onPressed: () {
                  //we can enchance this code
                  // we do not need to change all CameraPostin i nedd only to change latlng
                  //**/ the first way to change lat and lang */
                  CameraUpdate newLatLang = CameraUpdate.newLatLng(
                      const LatLng(30.806139615930157, 30.982184614045845));

                  googleMapController!.animateCamera(newLatLang);
                  //**/  second way to change camera positon  */
                  // CameraPosition newLoaction = const CameraPosition(
                  //     zoom: 12,
                  //     target: LatLng(30.806139615930157, 30.982184614045845));
                  // googleMapController.animateCamera(
                  //     CameraUpdate.newCameraPosition(newLoaction));

                  // googleMapController.moveCamera(CameraUpdate.newCameraPosition(
                  //     const CameraPosition(
                  //         zoom: 13,
                  //         target:
                  //             LatLng(30.806139615930157, 30.982184614045845))));
                },
                child: const Text('Change Location')))
      ],
    );
  }

//********************* LOCATION PERMISSION **********************************************************************/
// * before acces location we need some steps
// *   1- inquire about loaciton service  in mobile phone it self
// *   2- request Permission
// *   3- GET location
// *   4- disply

  void updateLocation() async {
    // /  await locatoinService.checkAndRequestLoactionService();

    //   await locatoinService.checkAndRequestLoactionPermsiion();

    locatoinService.getRealTimeLoaction((locationData) async {
      await setMarkerMyLoation(locationData);
      updateCameraPosition(locationData);
    });
  }

  void updateCameraPosition(LocationData locationData) {
    if (isFirstCall) {
      CameraPosition cameraPosition = CameraPosition(
          zoom: 15,
          target: LatLng(locationData.latitude!, locationData.longitude!));
      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    } else {
      googleMapController?.animateCamera(CameraUpdate.newLatLng(
          LatLng(locationData.latitude!, locationData.longitude!)));
    }
  }

  Future<void> setMarkerMyLoation(LocationData locationData) async {
    var myIcon = BitmapDescriptor.fromBytes(
        await getImageFromRowData('assets/images/abdo.jpg', 80));
    var myMarke = Marker(
        icon: myIcon,
        onTap: () {
          print('abdo abdelhady ');
        },
        markerId: const MarkerId('1'),
        infoWindow: const InfoWindow(title: 'Abdelhady House'),
        position: LatLng(locationData.latitude!, locationData.longitude!));
    myMarker.add(myMarke);
    setState(() {});
  }

//********************************************************************************************************************* */
  initStyleGoolgMap() async {
    // to get the map that you style it you need to laod the json file then update google maps
    //*  to load string form assets you will use class DefaultAssetBundle  /
    var mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night_map_style.json');
    setState(() {
      _mapStyle = mapStyle;
    });
  }

  //* to chnage the image size of marker / /* i use this function wehn i do not have access in my images come from api
  Future<Uint8List> getImageFromRowData(String imagePath, double width) async {
    // first i load the image to bytedata
    ByteData imageData = await rootBundle.load(imagePath);
    // then i convert it to uint8list
    var imageCodec = await ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: width.round());
    // that return the information of image  this is the final image but we need to convert it to Uint8List
    var imageFrame = await imageCodec.getNextFrame();
    var imageByteData =
        await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);
    return imageByteData!.buffer.asUint8List();
  }

  void initMakeMarker() async {
    // var myCustomICon = BitmapDescriptor.fromBytes(
    //     await getImageFromRowData('assets/images/icons8-image-100.png', 70));
    // //! if i want to load image form assets as marker i use that code when i have access in my image in asset images
    var myCustomICon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/icons8-image-100.png');
    var myset = myPlaces.map((e) {
      return Marker(
          icon: myCustomICon,
          infoWindow: InfoWindow(title: e.name, onTap: () {}),
          markerId: MarkerId(e.id.toString()),
          position: e.latLng);
    }).toSet();

    myMarker.addAll(myset);
    setState(() {});
    // //! first i created the merker so then i must make this marker point in something in the map
    // var newMarker = const Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(30.25531977978793, 31.164440253622903));
    // //! how to updatea the map
    // myMarker.add(newMarker);
  }

  void initPolyLines() {
    Polyline myLine1 = const Polyline(
        patterns: [PatternItem.dot],
        zIndex: 2,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        width: 2,
        polylineId: PolylineId("1"),
        color: Colors.green,
        points: [
          LatLng(30.25008902547044, 31.164040659278093),
          LatLng(30.262099542643394, 31.167044733209348),
          LatLng(30.255946189533454, 31.17395410325124)
        ]);

    Polyline myLine2 = const Polyline(
        width: 2,
        polylineId: PolylineId('2'),
        zIndex: 1,
        points: [
          LatLng(30.249570019406963, 31.17206582820874),
          LatLng(30.260320299439087, 31.158847902911205)
        ]);
    myPolyLines.add(myLine1);
    myPolyLines.add(myLine2);
  }

  void initPolyGones() {
    //* the first point is the last point in polgon بيغطى منطقه معينه /
    Polygon polygon = const Polygon(
        holes: [
          [
            LatLng(30.256131537125835, 31.165628526927474),
            LatLng(30.25905998266544, 31.168203447439982),
            LatLng(30.25520479566638, 31.17223748957624),
          ]
        ],
        strokeWidth: 3,
        fillColor: Colors.grey,
        polygonId: PolygonId('1'),
        points: [
          LatLng(30.26413821918322, 31.163482759833716),
          LatLng(30.25546428415641, 31.160349939876834),
          LatLng(30.247790549232015, 31.17030629919186),
          LatLng(30.259171187737234, 31.179661843720634)
        ]);
    myPolygones.add(polygon);
  }

  void initCircle() {
    Circle sindibisArea = Circle(
        strokeWidth: 2,
        fillColor: Colors.black.withOpacity(0.2),
        circleId: CircleId('1'),
        center: LatLng(30.25464874659377, 31.166186426371848),
        radius: 500);
    myCircles.add(sindibisArea);
  }
}
