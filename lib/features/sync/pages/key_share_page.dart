import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../data/repositories/settings_repository.dart';

/// A page for sharing and scanning search case forensic keys.
/// 
/// Responders can display their case key as a QR code for others 
/// to scan, or use the camera to scan a key from another device.
class KeySharePage extends StatefulWidget {
  final SettingsRepository settingsRepository;

  const KeySharePage({super.key, required this.settingsRepository});

  @override
  State<KeySharePage> createState() => _KeySharePageState();
}

class _KeySharePageState extends State<KeySharePage> {
  String? _scannedKey;

  @override
  Widget build(BuildContext context) {
    final currentKey = widget.settingsRepository.casePassphrase;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Share Case Key'),
          backgroundColor: Colors.orange[800],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.qr_code), text: 'Share'),
              Tab(icon: Icon(Icons.qr_code_scanner), text: 'Scan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Share Tab
            Center(
              child: currentKey != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Scan this code to sync case key', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        QrImageView(
                          data: currentKey,
                          version: QrVersions.auto,
                          size: 250.0,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Text('Current Key: $currentKey', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  : const Text('No case key set. Create a search grid first.'),
            ),
            // Scan Tab
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        if (barcode.rawValue != null) {
                          setState(() {
                            _scannedKey = barcode.rawValue;
                          });
                        }
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.black87,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _scannedKey != null ? 'Scanned Key: $_scannedKey' : 'Point camera at QR code',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        if (_scannedKey != null)
                          ElevatedButton(
                            onPressed: () async {
                              await widget.settingsRepository.setCasePassphrase(_scannedKey);
                              if (mounted) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Case key updated successfully!')),
                                  );
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: const Text('Apply Scanned Key'),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
