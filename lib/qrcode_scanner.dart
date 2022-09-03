library qrcode_scanner;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class QRCodeScanner {
  static Future<ScanResult?> scan() async {
    ScanResult? scanResult;

    const flashOnController = 'Flash on';
    const flashOffController = 'Flash off';
    const cancelController = 'Cancel';

    const aspectTolerance = 0.001;
    // final _numberOfCameras = 0;
    const selectedCamera = -1;
    const useAutoFocus = true;
    const autoEnableFlash = false;

    final possibleFormats = BarcodeFormat.values.toList()
      ..removeWhere((e) => e == BarcodeFormat.unknown);

    List<BarcodeFormat> selectedFormats = [...possibleFormats];
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': cancelController,
            'flash_on': flashOnController,
            'flash_off': flashOffController,
          },
          restrictFormat: selectedFormats,
          useCamera: selectedCamera,
          autoEnableFlash: autoEnableFlash,
          android: const AndroidOptions(
            aspectTolerance: aspectTolerance,
            useAutoFocus: useAutoFocus,
          ),
        ),
      );
      scanResult = result;
    } on PlatformException catch (e) {
      scanResult = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'The user did not grant the camera permission!'
            : 'Unknown error: $e',
      );
    }
    return scanResult;
  }
}
