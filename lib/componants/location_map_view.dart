import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import '../screens/bill_screen/controller/bill_controller.dart';

class LocationMapView extends StatelessWidget {
  final double latitude;
  final double longitude;
  final address;
  // BitmapDescriptor? imageMarker;
  // Marker? marker; //pin marker on circle

  LocationMapView({required this.latitude, required this.address, required this.longitude});

  @override
  Widget build(BuildContext context) {
final controller=Get.put(BillController());
    return Scaffold(
        body: Center(
            child: FutureBuilder(
            future: controller.drawPins(LatLng(latitude, longitude)),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return CupertinoActivityIndicator();
    } else if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
    } else {
    return
    GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 14,
          ),
          markers: controller.markers.toSet(),
          onMapCreated: (g)async{
            controller.  isLoading.value=false;

            await  controller.drawPins(LatLng(latitude,longitude));

          },
    );
    }
    },
            ),
        ),
    );
  }
// }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

  // Future<Uint8List> getMarker(int width) async {
  //   ByteData data = await rootBundle.load('assets/images/location.png');
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),  targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  // }


  }
