
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapView extends StatelessWidget {
  final double latitude;
  final double longitude;
  final   address;

  LocationMapView({required this.latitude,required this.address, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Location'),
      // ),
      body: Center(
        child: GoogleMap(  mapType: MapType.normal,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,

          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(
                    () => TapGestureRecognizer()))
            ..add(Factory<
                VerticalDragGestureRecognizer>(
                    () =>VerticalDragGestureRecognizer())),
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: MarkerId('location'),
              position: LatLng( latitude,  longitude),
              onTap: () {
                // Get.snackbar('Location', address);
              },
            ),
          },
        ),
      ),
    );
  }
}
