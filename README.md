# qrcode_scanner
 custom qr code scanner from packages barcode_scan2

# Example

```dart
ScanResult? result = await QRCodeScanner.scan();
print(result?.rawContent);
```