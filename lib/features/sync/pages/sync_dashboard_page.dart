import 'package:flutter/material.dart';
import '../github_sync_service.dart';
import '../../../data/repositories/isar_repository.dart';

class SyncDashboardPage extends StatefulWidget {
  final IsarRepository isarRepository;
  final GitHubSyncService syncService;

  const SyncDashboardPage({
    super.key,
    required this.isarRepository,
    required this.syncService,
  });

  @override
  State<SyncDashboardPage> createState() => _SyncDashboardPageState();
}

class _SyncDashboardPageState extends State<SyncDashboardPage> {
  bool _isSyncing = false;

  void _syncGitHub() async {
    setState(() => _isSyncing = true);
    
    // Simulate GitHub Sync
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() => _isSyncing = false);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('GitHub Sync Complete')),
    );
  }

  void _syncP2PMesh() {
    // Logic for P2P Wi-Fi Direct Sync would go here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Searching for peer responders...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Synchronization')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sync, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isSyncing ? null : _syncGitHub,
              icon: _isSyncing ? const CircularProgressIndicator() : const Icon(Icons.cloud_download),
              label: const Text('Sync with GitHub (Central)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _syncP2PMesh,
              icon: const Icon(Icons.wifi_tethering),
              label: const Text('Sync with Local Mesh (P2P)'),
            ),
            const SizedBox(height: 40),
            Text(
              'Last Sync: 2 minutes ago',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
