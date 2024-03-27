import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/near_by_places_model/result.dart';
import 'package:flutter_application_2/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:flutter_application_2/utils/Loaction_Service.dart';
import 'package:flutter_application_2/utils/maps_service.dart';
import 'package:flutter_application_2/utils/places_service.dart';
import 'package:flutter_application_2/utils/routes_service.dart';
import 'package:flutter_application_2/widgets/Custom_text_field.dart';
import 'package:flutter_application_2/widgets/customListView.dart';
import 'package:flutter_application_2/widgets/custome_bottom_sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class GoolgeMapView extends StatefulWidget {
  const GoolgeMapView({super.key});
  @override
  State<GoolgeMapView> createState() => _GoolgeMapViewState();
}

class _GoolgeMapViewState extends State<GoolgeMapView> {
  late MapsService mapsService;
  late RoutesService routeService; //*
  String? sesionToken;
  late Uuid uuid;
  late TextEditingController textEditingController;
  late TextEditingController distanceController;
  late TextEditingController typeContrller;
  late PlacesService goolgMapsPlacesService; //*
  late CameraPosition initalCameraPostion;
  late LocatoinService locatoinService; //*
  late GoogleMapController googleMapController;
  Set<Marker> myMarker = {};
  Set<Polyline> polyLine = {};
  late LatLng myLocation;
  late LatLng destination;
  List<PlaceAutocompleteModel> places = [];
  List<Result> nearByPlaces = [];

  //**************************************************************************************************************************/
  @override
  void initState() {
    mapsService = MapsService();
    routeService = RoutesService();
    uuid = const Uuid();
    distanceController = TextEditingController();
    typeContrller = TextEditingController();
    goolgMapsPlacesService = PlacesService();
    textEditingController = TextEditingController();
    locatoinService = LocatoinService();
    initalCameraPostion = const CameraPosition(
        zoom: 5, target: LatLng(26.93162820301766, 27.939896854883948));

    fetchPredcitons();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  void fetchPredcitons() async {
    //* we want to find the start state of search and last state of search to create new UUID
    textEditingController.addListener(() async {
      sesionToken ??= uuid.v4();
      places = await mapsService.getPerdictions(
          input: textEditingController,
          sesionToken: sesionToken!,
          places: places);
      setState(() {});
    });
    setState(() {});
  }

//**************************************************************************************************************************/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              polylines: polyLine,
              onMapCreated: (controller) {
                googleMapController = controller;
                updatLocation();
              },
              markers: myMarker,
              zoomControlsEnabled: false,
              initialCameraPosition: initalCameraPostion),
          Positioned(
              top: 40,
              left: 8,
              right: 8,
              child: Column(
                children: [
                  CustomeTextFiled(
                    textEditingController: textEditingController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Offstage(
                    offstage: places.length == 0,
                    child: CustomListView(
                      onPlaceSelected: (placeDetail) async {
                        textEditingController.clear();
                        places = [];
                        //* the end of state of seesion token
                        sesionToken = null;
                        destination = LatLng(
                            placeDetail.geometry!.location!.lat!.toDouble(),
                            placeDetail.geometry!.location!.lng!.toDouble());

                        var points = await mapsService.getRouteData(
                            myLocation: myLocation, destination: destination);
                        mapsService.displayRoute(points,
                            googleMapController: googleMapController,
                            polyLine: polyLine);

                        setState(() {});
                      },
                      places: places,
                      goolgMapsPlacesService: goolgMapsPlacesService,
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: 30,
            right: 16,
            child: Row(
              children: [
                //! here
                CustomeTextFiled(
                    onChanged: (val) {
                      typeContrller.text = val.toString();
                    },
                    width: MediaQuery.of(context).size.width / 4,
                    textInputType: TextInputType.text,
                    textEditingController: typeContrller,
                    hinText: 'Enter Type'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomeTextFiled(
                      width: MediaQuery.of(context).size.width / 6,
                      textInputType: TextInputType.number,
                      textEditingController: distanceController,
                      onChanged: (val) {
                        distanceController.text = val.toLowerCase();
                      },
                      hinText: 'Enter Distance'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    handleRequestsForFindPlaces(context);
                  },
                  child: Text(
                    'find nearby places',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//*****************************/ this all funciton that we use **************************************************************/
  void handleRequestsForFindPlaces(BuildContext context) {
    if (typeContrller.text.isNotEmpty && distanceController.text.isNotEmpty) {
      getNearByPlacesByDefault(
              key: typeContrller.text.toString(),
              raduis: int.parse(distanceController.text.toString()))
          .then((value) {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return nearByPlaces.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.all(30),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () async {
                                  destination = LatLng(
                                      nearByPlaces[index]
                                          .geometry!
                                          .location!
                                          .lat!
                                          .toDouble(),
                                      nearByPlaces[index]
                                          .geometry!
                                          .location!
                                          .lng!
                                          .toDouble());

                                  var points = await mapsService.getRouteData(
                                      myLocation: myLocation,
                                      destination: destination);
                                  mapsService.displayRoute(points,
                                      googleMapController: googleMapController,
                                      polyLine: polyLine);
                                  Navigator.pop(context);

                                  setState(() {});
                                },
                                child: BuildItemBottomsheet(
                                    places: nearByPlaces[index]));
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: nearByPlaces.length),
                    )
                  : Container(
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: double.infinity,
                      child: const Center(child: Text('No Data found ')));
            });
        setState(() {});
      });
    } else {
      getNearByPlacesByDefault().then((value) {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(30),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () async {
                            destination = LatLng(
                                nearByPlaces[index]
                                    .geometry!
                                    .location!
                                    .lat!
                                    .toDouble(),
                                nearByPlaces[index]
                                    .geometry!
                                    .location!
                                    .lng!
                                    .toDouble());
                            var points = await mapsService.getRouteData(
                                myLocation: myLocation,
                                destination: destination);
                            mapsService.displayRoute(points,
                                googleMapController: googleMapController,
                                polyLine: polyLine);
                            Navigator.pop(context);

                            setState(() {});
                          },
                          child: BuildItemBottomsheet(
                              places: nearByPlaces[index]));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: nearByPlaces.length),
              );
            });
        setState(() {});
      });
    }
  }

  void updatLocation() async {
    try {
      myLocation = await mapsService.updateCurrentLocation(
          googleMapController: googleMapController, myMarker: myMarker);
      setState(() {});
    } on LocationServiceException catch (e) {
      //TODO
    } on LocationPermissionException catch (e) {
      //TODO
    } catch (e) {
      //TODO
    }
  }

  Future getNearByPlacesByDefault({String? key, int? raduis}) async {
    print('dddddddddd'); //log('${myLocation.toString()}');
    var resuults = await goolgMapsPlacesService.getNearbyPlaces(
        keyWord: key ?? 'ATMs',
        raduis: raduis ?? 150000,
        location:
            ' ${myLocation.latitude.toString() + ',' + myLocation.longitude.toString()}');
    nearByPlaces.clear();
    nearByPlaces.addAll(resuults!.results!);
    setState(() {});
  }

//*****************************/ this all funciton that we use ************************************/
}
