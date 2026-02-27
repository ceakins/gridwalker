import 'package:flutter/material.dart';
import '../../../core/utils/permission_handler.dart';

class LocationPermissionScreen extends StatelessWidget {
  final VoidCallback onPermissionGranted;

  const LocationPermissionScreen({super.key, required this.onPermissionGranted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(title: const Text('Setup Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 80, color: Colors.orange),
            const SizedBox(height: 24),
            const Text(
              'Enable High-Precision Tracking',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'To record your search grid coverage effectively, GridWalker needs permission to access your location even when you switch to other apps or lock your screen.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Trigger the sequential Disclosure -> Permission flow
                  LocationPermissionHandler.showProminentDisclosure(
                    context, 
                    () async {
                      final granted = await LocationPermissionHandler.requestLocationPermissions(context);
                      if (granted) {
                        onPermissionGranted();
                      }
                    }
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Configure Permissions', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
