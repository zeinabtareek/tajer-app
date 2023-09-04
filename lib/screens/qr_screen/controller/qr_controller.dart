import 'package:get/get.dart';
import 'package:tajer/screens/qr_screen/services/qr_services.dart';

class QrController extends GetxController{





  bool isTextBarcode(String barcode) {
    final RegExp textRegExp = RegExp(r'[a-zA-Z]');
    final RegExp numberRegExp = RegExp(r'[0-9]');

    return textRegExp.hasMatch(barcode) && !numberRegExp.hasMatch(barcode);
  }

  scanToCreateAnOrder(barcodeValue)async{
    await QrServices.scanToCreateAnOrder(barcodeValue);
  }


    handleBarcode(String barcode) {
    if (isTextBarcode(barcode)) {
      // Barcode contains only text
      scanToCreateAnOrder(barcode);
    } else {
      // Barcode contains numbers or alphanumeric characters
      // Handle accordingly
      int? numericValue = int.tryParse(barcode);
      if (numericValue != null) {
        // Barcode is a numeric value
        scanToCreateAnOrder(numericValue.toString());
      } else {
        // Barcode is alphanumeric or not a valid number
        // Handle accordingly
        print('Invalid barcode format: $barcode');
      }
    }
  }
}