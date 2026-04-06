import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// The visual content for the splash screen and information dialogs.
/// 
/// Displays the GridWalker logo, author information, open-source 
/// mission statement, and donation links.
class SplashContent extends StatelessWidget {
  /// Whether to display a close button (e.g., when shown in a dialog).
  final bool showCloseButton;

  const SplashContent({super.key, this.showCloseButton = false});

  /// Launches an external [url] using the default system browser.
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'gridwalker_sar_icon.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'GridWalker SAR',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Written by Charles L. Eakins',
                  style: TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const Text(
                  '© 2026',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'GridWalker is an Open Source project developed to provide offline-first tools for Search and Rescue teams.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () => _launchUrl('https://github.com/ceakins/gridwalker'),
                  icon: const Icon(Icons.code, color: Colors.blue),
                  label: const Text('View Source on GitHub', style: TextStyle(color: Colors.blue)),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Support this project and donate:',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => _launchUrl('https://ko-fi.com/ceakins'),
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  label: const Text('Donate via Ko-fi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 48),
                if (!showCloseButton)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    strokeWidth: 2,
                  ),
              ],
            ),
          ),
        ),
        if (showCloseButton)
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
      ],
    );
  }
}
