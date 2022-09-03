# qrcode_scanner
 custom qr code scanner from packages barcode_scan2

# Example

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrcode_scanner/qrcode_scanner.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  ScanResult? result = await QRCodeScanner.scan();
                  setState(() {
                    this.result = result?.rawContent;
                  });
                },
                child: const Text("Scan"),
              ),
              Text(result ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}

```