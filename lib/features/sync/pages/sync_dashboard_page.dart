import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/app_bloc.dart';
import '../../../core/bloc/app_event.dart';
import '../../../core/bloc/app_state.dart';
import '../github_sync_service.dart';
import '../../../data/repositories/isar_repository.dart';
import 'key_share_page.dart';

class SyncDashboardPage extends StatelessWidget {
  final IsarRepository isarRepository;
  final GitHubSyncService syncService;

  const SyncDashboardPage({
    super.key,
    required this.isarRepository,
    required this.syncService,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Data Management')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.share, size: 48, color: Colors.blue),
                      SizedBox(height: 8),
                      Text('Local Data Sharing', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Share your search grid with other responders nearby.', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.read<AppBloc>().add(ExportGrid()),
                icon: const Icon(Icons.upload_file),
                label: const Text('Export Search Grid (JSON)'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () async {
                  final bloc = context.read<AppBloc>();
                  if (bloc.settingsRepository.casePassphrase == null) {
                    final proceed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Encryption Key Missing'),
                        content: const Text('No case key is set. If the file you are importing contains encrypted photos, you should scan the case QR key first. Proceed anyway?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Scan QR Key')),
                          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Proceed (Standard)')),
                        ],
                      ),
                    );

                    if (proceed == false && context.mounted) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => KeySharePage(settingsRepository: bloc.settingsRepository)));
                      return;
                    }
                    if (proceed == null) return;
                  }
                  
                  if (context.mounted) {
                    bloc.add(const ImportGrid());
                  }
                },
                icon: const Icon(Icons.file_download),
                label: const Text('Import Search Grid (JSON)'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  final bloc = context.read<AppBloc>();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => KeySharePage(settingsRepository: bloc.settingsRepository),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code_2),
                label: const Text('Sync Case Key (QR)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.orange[800],
                  foregroundColor: Colors.white,
                ),
              ),
              const Divider(height: 48),
              const Text('Cloud Synchronization', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('P2P Mesh Discovery starting...'))),
                icon: const Icon(Icons.wifi_tethering),
                label: const Text('Sync with Local Mesh (P2P)'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('GitHub cloud sync not configured.'))),
                icon: const Icon(Icons.cloud_sync),
                label: const Text('Sync with GitHub (Central)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
