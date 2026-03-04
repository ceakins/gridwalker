import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  /// Displays the prominent disclosure required by Google Play for Background Location.
  static Future<void> showLocationDisclosure(BuildContext context, VoidCallback onAgreed) async {
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
        if (context.mounted) {
          _showSettingsDialog(context, 'Location', 'Allow all the time');
        }
      }
      // If foreground is granted but background is not, we still return true
      // because the app can function (mostly) with foreground only.
      return true;
    }
    return false;
  }

  /// Handles Camera permission request for forensics.
  static Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      if (context.mounted) {
        _showSettingsDialog(context, 'Camera', 'Allow');
      }
    }
    return false;
  }

  static void _showSettingsDialog(BuildContext context, String feature, String permissionName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$feature Permission Required'),
        content: Text(
          'To use this feature, please enable $feature access (set to "$permissionName") in the App Settings.',
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
