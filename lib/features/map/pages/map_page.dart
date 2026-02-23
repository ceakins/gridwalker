import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import '../../../core/bloc/app_bloc.dart';
import '../../../core/bloc/app_state.dart';
import '../../../core/bloc/app_event.dart';
import '../../sync/pages/sync_dashboard_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapLibreMapController? mapController;

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridWalker SAR'),
        backgroundColor: Colors.orange[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              final bloc = context.read<AppBloc>();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SyncDashboardPage(
                    isarRepository: bloc.isarRepository,
                    syncService: bloc.syncService,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MapLibreMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(34.5400, -112.4685),
              zoom: 12.0,
            ),
            styleString: MapLibreStyles.demo,
            myLocationEnabled: true,
            trackCameraPosition: true,
          ),
          BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return FloatingActionButton(
                heroTag: 'tracking_toggle',
                backgroundColor: state.isTracking ? Colors.red : Colors.green,
                onPressed: () {
                  if (state.isTracking) {
                    context.read<AppBloc>().add(StopTracking());
                  } else {
                    context.read<AppBloc>().add(const StartTracking(
                          state: 'AZ',
                          county: 'Yavapai',
                        ));
                  }
                },
                child: Icon(state.isTracking ? Icons.stop : Icons.play_arrow),
              );
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'zoom_in',
            mini: true,
            onPressed: () => mapController?.animateCamera(CameraUpdate.zoomIn()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'zoom_out',
            mini: true,
            onPressed: () => mapController?.animateCamera(CameraUpdate.zoomOut()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
