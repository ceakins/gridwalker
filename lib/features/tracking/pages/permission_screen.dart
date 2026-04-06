import 'package:flutter/material.dart';
import '../../../core/utils/permission_handler.dart';

/// A multi-step onboarding screen for configuring app permissions.
/// 
/// Guides the user through location disclosure and camera permission 
/// requests necessary for core search and rescue functionality.
class PermissionOnboardingScreen extends StatefulWidget {
  /// Callback triggered once all required permissions have been handled.
  final VoidCallback onAllPermissionsGranted;

  const PermissionOnboardingScreen({super.key, required this.onAllPermissionsGranted});

  @override
  State<PermissionOnboardingScreen> createState() => _PermissionOnboardingScreenState();
}

class _PermissionOnboardingScreenState extends State<PermissionOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  /// Advances to the next onboarding step or completes the process.
  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentPage++);
    } else {
      widget.onAllPermissionsGranted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('App Setup'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildLocationStep(),
          _buildCameraStep(),
        ],
      ),
    );
  }

  /// Builds the location permission step with an explanation of usage.
  Widget _buildLocationStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, size: 80, color: Colors.orange),
          const SizedBox(height: 24),
          const Text(
            'Step 1: Location Tracking',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'GridWalker needs high-precision location to record your search coverage and track paths in real-time.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AppPermissionHandler.showLocationDisclosure(context, () async {
                  final granted = await AppPermissionHandler.requestLocationPermissions(context);
                  if (granted) _nextPage();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Configure Location', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the camera permission step for forensic photo documentation.
  Widget _buildCameraStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 80, color: Colors.blue),
          const SizedBox(height: 24),
          const Text(
            'Step 2: Forensic Photos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'To document clues and subjects, the app requires camera access to attach encrypted forensic photos to map markers.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final granted = await AppPermissionHandler.requestCameraPermission(context);
                if (granted) _nextPage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Configure Camera', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
          TextButton(
            onPressed: _nextPage,
            child: const Text('Skip for now', style: TextStyle(color: Colors.white54)),
          ),
        ],
      ),
    );
  }
}
