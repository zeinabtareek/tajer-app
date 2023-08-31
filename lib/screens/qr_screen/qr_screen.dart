import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constants/style.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  //* qr scan transaction
  bool isScanComplete = false;
int _count=60;
  //* flash bool
  bool isFlash = false;

  //* cam bool
  bool isCam = false;

  //* toggle flash controller
  MobileScannerController controller = MobileScannerController();

  //* change page
  void closeScanner() {
    setState(() {
      isScanComplete = false;
    });
  }
  // BarcodeCapture barcodeCapture = BarcodeCapture(barcodes: [], raw: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // body: Stack(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     MobileScanner(
      //         controller: controller,
      //         onDetect: (capture) {
      //           final List<Barcode> barcodes = capture.barcodes;
      //           final Uint8List? image = capture.image;
      //           for (final barcode in barcodes) {
      //             debugPrint('Barcode found! ${barcode.rawValue}');
      //           }
      //           if (image != null) {
      //             showDialog(
      //               context: context,
      //               builder: (context) => Image(image: MemoryImage(image)),
      //             );
      //             Future.delayed(const Duration(seconds: 5), () {
      //               Navigator.pop(context);
      //             });
      //           }
      //         }),
      //
      //     Positioned(
      //       top: 20,
      //       right: 0,
      //       left: 0,
      //       child: Column(
      //         children: [
      //
      //           Text(  " % ${(_count.toDouble())} في تقدم " ,style: TextStyle(color: K.whiteColor,fontWeight: FontWeight.w600,fontSize: 20.sp),),
      //           LinearPercentIndicator(
      //             width: 300,
      //             lineHeight: 10.0,
      //             percent: (_count.toDouble())/100,
      //             backgroundColor: K.whiteColor,
      //             progressColor: K.semiDarkRed,
      //
      //             // progressColor: Colors.green,
      //             // fillColor: Colors.red.shade200,
      //             animation: true,
      //             // animationDuration: ,
      //             leading: Text(" "),
      //             trailing: Text(" "),
      //             center: Text(" "),
      //             barRadius: Radius.circular(5),
      //             alignment: MainAxisAlignment.center,
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             // animateFromLastPercent: true,
      //             // linearGradient: LinearGradient(colors: [ K.darkRed, K.primaryColor,], ),
      //             // addAutomaticKeepAlive: true,
      //             // isRTL: true,
      //             // maskFilter: MaskFilter.blur(BlurStyle.normal, 5.0),
      //             // curve: Curves.linear,
      //             // clipLinearGradient: true,
      //             // restartAnimation: true,
      //             // onAnimationEnd: (){print('progress...');},
      //             // widgetIndicator: Icon(Icons.arrow_downward_outlined),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      // ),

     body: Stack(
        children: [



          MobileScanner(
              // allowDuplicates: false,
              controller: controller,
              onDetect: (capture) {
                final String? code = capture.raw;
                debugPrint('Barcode found! $code');
                final List<Barcode> barcodes = capture.barcodes;
                          final Uint8List? image = capture.image;
                          for (final barcode in barcodes) {
                            debugPrint('Barcode found! ${barcode.rawValue}');
                          }
                          if (image != null) {
                            showDialog(
                              context: context,
                              builder: (context) => Image(image: MemoryImage(image)),
                            );
                            Future.delayed(const Duration(seconds: 5), () {
                              Navigator.pop(context);
                            });
                          }
                        }),

          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Column(
              children: [

                Text(  " % ${(_count.toDouble())} في تقدم " ,style: TextStyle(color: K.whiteColor,fontWeight: FontWeight.w600,fontSize: 20.sp),),
                LinearPercentIndicator(
                  width: 300,
                  lineHeight: 10.0,
                  percent: (_count.toDouble())/100,
                  backgroundColor: K.whiteColor,
                  progressColor: K.semiDarkRed,
                  animation: true,
                  // animationDuration: ,
                  leading: Text(" "),
                  trailing: Text(" "),
                  center: Text(" "),
                  barRadius: Radius.circular(5),
                  alignment: MainAxisAlignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // animateFromLastPercent: true,
                  // linearGradient: LinearGradient(colors: [ K.darkRed, K.primaryColor,], ),
                  // addAutomaticKeepAlive: true,
                  // isRTL: true,
                  // maskFilter: MaskFilter.blur(BlurStyle.normal, 5.0),
                  // curve: Curves.linear,
                  // clipLinearGradient: true,
                  // restartAnimation: true,
                  // onAnimationEnd: (){print('progress...');},
                  // widgetIndicator: Icon(Icons.arrow_downward_outlined),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

// class MyTool extends StatelessWidget {
//   const MyTool({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.onPressed,
//   });
//
//   final Icon icon;
//   final String text;
//   final Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         height: 30,
//         width: 30,
//         decoration: BoxDecoration(
//           color: Colors.brown[700],
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: Column(
//           children: [
//             Icon(icon.icon, color: Colors.white, size: 30),
//             const SizedBox(height: 4),
//             Text(
//               text,
//               // style: Theme.of(context).textTheme.headline5,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 330.0;
    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
            overlayColour, BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: scanArea,
                width: scanArea,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          foregroundPainter: BorderPainter(),
          child: SizedBox(
            width: scanArea + 25,
            height: scanArea + 25,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
