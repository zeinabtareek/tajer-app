
  import 'dart:typed_data';
import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
  import 'dart:convert';
import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/screens/orders_screen/services/order_services.dart';
  import 'package:geocoding/geocoding.dart';
  import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

  import 'package:flutter/services.dart' show rootBundle;
  import 'dart:ui' as ui;

import '../../../constants/style.dart';
import '../../../model/order_details_model.dart';
import '../../../utils/overlay_helper.dart';

class BillController extends BaseController {
  final service = OrderServices();
  final searchController = ''.obs;
  final address = ''.obs;
  final notes = ''.obs;
  final showOverlay = false.obs;
  final isLoading = false.obs;

  final total=0.0.obs;
  // cancelOrder({int? id}) async {
  //   await service.cancelOrder(id: id);
  //   Get.back();
  // }


  List<Marker> markers=[];
  onInit()async{
    super.onInit();
    await drawPins;

  }
  cancelOrder({int? id, String? note}) async {
    await service.cancelOrder(id: id, note: note);
    Get.back();
  }

  acceptOrder({int? id}) async {

    await service.acceptOrder(id: id);
    Get.back();
  }
  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        return placemarks[0].street; // You can access other address fields as well, such as city, state, etc.
      }
    } catch (e) {
      print('Error getting address: $e');
    }
    return '';
  }
  Future<Uint8List> getBytesFromAsset(String path, int width, Color color) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();

    // Create a new image with the specified color
    final paintedImage = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = color;
    canvas.drawImage(fi.image, Offset.zero, paint);
    final picture = recorder.endRecording();
    final p = await picture.toImage(width,200);
    final paintedData = await p.toByteData(format: ui.ImageByteFormat.png);

    return paintedData!.buffer.asUint8List();
  }





drawPins(LatLng element)async{
  final Uint8List markerIcon = await getBytesFromAsset('assets/images/location.png', 90,K.semiDarkRed);
  BitmapDescriptor markerBitmap = BitmapDescriptor.fromBytes(markerIcon);
  // isLoading.value=false;
  markers.add(Marker(
      onTap: () async {
        // Get.to(
        //         () => TrapDetailsScreen(
        //       isThereEmergencyToday: element.isThereEmergencyToday,
        //       id: element.id,
        //       name: element.name,
        //     ),
        //     transition: Transition.leftToRight);
      },
      icon: markerBitmap,
      markerId: MarkerId("ddd"),
      position: LatLng(element.latitude, element.longitude)));
  // isLoading.value=false;

  update();
}

}




