import 'package:flutter/material.dart';
import '../../map/pages/map_page.dart';
import '../widgets/splash_content.dart';

/// The initial loading screen shown when the app launches.
/// 
/// It displays brand identity and copyright information before 
/// automatically transitioning to the [MapPage] after a 5-second delay.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  /// Initiates a delayed navigation to the main map screen.
  void _navigateToHome() async {
    // Set splash duration to 5 seconds
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MapPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SplashContent(showCloseButton: false),
    );
  }
}
