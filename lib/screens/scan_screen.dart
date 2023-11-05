import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

List<dynamic> rawBytes = [];
List<dynamic> resultPoints = [];
List<dynamic> format = [];
List<dynamic> numBits = [];
List<dynamic> resultMetaData = [];
List<dynamic> time = [];

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late QRCodeDartScanController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = QRCodeDartScanController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRCodeDartScanView(
            controller: controller,
            scanInvertedQRCode:
                true, // enable scan invert qr code ( default = false)
            typeScan: TypeScan
                .live, // if TypeScan.takePicture will try decode when click to take a picture (default TypeScan.live)
            // takePictureButtonBuilder: (context, controller, isLoading) {
            // if typeScan == TypeScan.takePicture you can customize the button.
            // if(loading) return CircularProgressIndicator();
            // return ElevatedButton(
            //   onPressed: controller.takePictureAndDecode,
            //   child: const Text('Take a picture', ),
            // );
            // },
            resolutionPreset: QRCodeDartScanResolutionPreset.high,
            // formats: [ // You can restrict specific formats.
            //   BarcodeFormat.QR_CODE,
            //   BarcodeFormat.AZTEC,
            //   BarcodeFormat.DATA_MATRIX,
            //   BarcodeFormat.PDF_417,
            //   BarcodeFormat.CODE_39,
            //   BarcodeFormat.CODE_93,
            //   BarcodeFormat.CODE_128,
            //  BarcodeFormat.EAN_8,
            //   BarcodeFormat.EAN_13,
            // ],
            onCapture: (Result result) async {
              //   Traverse a map of metadata stored with the barcode result.
              result.resultMetadata?.forEach((key, value) {
                debugPrint('$key : $value');
              });
            },
          ),
          Positioned(
            top: 70,
            left: 30,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
