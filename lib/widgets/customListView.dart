import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:flutter_application_2/models/place_detail_model/place_detail_model.dart';
import 'package:flutter_application_2/utils/places_service.dart';

class CustomListView extends StatefulWidget {
  const CustomListView(
      {super.key,
      required this.places,
      required this.goolgMapsPlacesService,
      required this.onPlaceSelected});

  final List<PlaceAutocompleteModel> places;
  final PlacesService goolgMapsPlacesService;
  final Function(PlaceDetailModel) onPlaceSelected;
  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ssssssssssssssss');
    print(widget.places.length);
    // setState(() {});
    return Container(
      color: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.map_rounded),
              title: Text('${widget.places[index].description}'),
              trailing: IconButton(
                  onPressed: () async {
                    var placeDtail = await widget.goolgMapsPlacesService
                        .getPlaceDetails(widget.places[index].placeId!);
                    // we need to do clear the textfrom filed the list disappear and send the details to widget goolgMapView
                    //  print(placeDtail!.geometry!.location!.lat!);
                    widget.onPlaceSelected(placeDtail!); // i call the function
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined)),
            );
          },
          separatorBuilder: ((context, index) {
            return const Divider(
              height: 0,
            );
          }),
          itemCount: widget.places.length),
    );
  }
}
