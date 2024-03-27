import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/google_map_view.dart';
import 'package:flutter_application_2/widgets/goole_maps_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const GoogleMapsTest());
}

class GoogleMapsTest extends StatelessWidget {
  const GoogleMapsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GoolgeMapView(),
    );
  }
}
