import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionHandler {
  /// Displays the prominent disclosure required by Google Play.
  static Future<void> showProminentDisclosure(BuildContext context, VoidCallback onAgreed) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Background Location Access'),
        content: const Text(
          'GridWalker SAR collects location data to enable tracking of your search grid coverage and route history, even when the app is closed or not in use.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No Thanks'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onAgreed();
            },
            child: const Text('I Agree'),
          ),
        ],
      ),
    );
  }

  /// Handles the sequential permission request: Foreground -> Background.
  static Future<bool> requestLocationPermissions(BuildContext context) async {
    // 1. Request Foreground Location (When In Use)
    final foregroundStatus = await Permission.locationWhenInUse.request();
    
    if (foregroundStatus.isGranted) {
      // 2. Request Background Location (Always) - Required for Android 11+
      final backgroundStatus = await Permission.locationAlways.request();
      
      if (backgroundStatus.isGranted) {
        return true;
      } else if (backgroundStatus.isPermanentlyDenied) {
        // Direct the user to settings if they denied background access previously
        if (context.mounted) {
          _showSettingsDialog(context);
        }
      }
    }
    return false;
  }

  static void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'To track your search path while the screen is off, please set Location access to "Allow all the time" in the App Settings.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }
}
