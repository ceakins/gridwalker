import 'dart:convert';
import 'dart:math';
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
  Circle? _userCircle;
  bool _isGridSourceAdded = false;
  bool _isSelectionSourceAdded = false;
  
  bool _isDrawing = false;
  LatLng? _dragStart;
  LatLng? _dragEnd;

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  void _onStyleLoaded() async {
    _setupGridLayers();
  }

  Future<void> _setupGridLayers() async {
    if (mapController == null) return;

    // 1. Grid Source & Layer (The actual search blocks)
    if (!_isGridSourceAdded) {
      await mapController?.addSource("grid-source", const GeojsonSourceProperties(data: {"type": "FeatureCollection", "features": []}));
      await mapController?.addFillLayer("grid-source", "grid-layer", const FillLayerProperties(
        fillColor: ["get", "color"],
        fillOpacity: 0.5,
        fillOutlineColor: "#ffffff",
      ));
      _isGridSourceAdded = true;
    }

    // 2. Selection Source & Layer (The preview box during drag)
    if (!_isSelectionSourceAdded) {
      await mapController?.addSource("selection-source", const GeojsonSourceProperties(data: {"type": "FeatureCollection", "features": []}));
      await mapController?.addFillLayer("selection-source", "selection-layer", const FillLayerProperties(
        fillColor: "#ff9800",
        fillOpacity: 0.3,
        fillOutlineColor: "#ff9800",
      ));
      _isSelectionSourceAdded = true;
    }
  }

  void _updateSelectionPreview() async {
    if (mapController == null || _dragStart == null || _dragEnd == null) return;

    final minLat = min(_dragStart!.latitude, _dragEnd!.latitude);
    final maxLat = max(_dragStart!.latitude, _dragEnd!.latitude);
    final minLng = min(_dragStart!.longitude, _dragEnd!.longitude);
    final maxLng = max(_dragStart!.longitude, _dragEnd!.longitude);

    final geoJson = {
      "type": "FeatureCollection",
      "features": [{
        "type": "Feature",
        "geometry": {
          "type": "Polygon",
          "coordinates": [[[minLng, minLat], [maxLng, minLat], [maxLng, maxLat], [minLng, maxLat], [minLng, minLat]]]
        }
      }]
    };

    await mapController?.setGeoJsonSource("selection-source", geoJson);
  }

  void _clearSelectionPreview() async {
    await mapController?.setGeoJsonSource("selection-source", {"type": "FeatureCollection", "features": []});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridWalker SR'),
        backgroundColor: Colors.orange[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              final bloc = context.read<AppBloc>();
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SyncDashboardPage(isarRepository: bloc.isarRepository, syncService: bloc.syncService)));
            },
          ),
        ],
      ),
      body: BlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) => 
            previous.isTracking != current.isTracking || 
            previous.currentPosition != current.currentPosition ||
            previous.gridCells.length != current.gridCells.length ||
            current.errorMessage != null,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }

          // Auto-recenter when tracking starts
          if (state.isTracking && state.currentPosition != null) {
             mapController?.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(state.currentPosition!.latitude, state.currentPosition!.longitude),
              ),
            );
          }

          _updateUserMarker(state);
          _updateGridMap(state);
        },
        child: GestureDetector(
          onLongPressStart: (details) async {
            if (!_isDrawing) return;
            final ratio = MediaQuery.of(context).devicePixelRatio;
            final latLng = await mapController?.toLatLng(Point(
              details.localPosition.dx * ratio,
              details.localPosition.dy * ratio,
            ));
            setState(() {
              _dragStart = latLng;
              _dragEnd = latLng;
            });
          },
          onLongPressMoveUpdate: (details) async {
            if (!_isDrawing || _dragStart == null) return;
            final ratio = MediaQuery.of(context).devicePixelRatio;
            final latLng = await mapController?.toLatLng(Point(
              details.localPosition.dx * ratio,
              details.localPosition.dy * ratio,
            ));
            setState(() => _dragEnd = latLng);
            _updateSelectionPreview();
          },
          onLongPressEnd: (details) async {
            if (!_isDrawing || _dragStart == null || _dragEnd == null) return;
            
            final minLat = min(_dragStart!.latitude, _dragEnd!.latitude);
            final maxLat = max(_dragStart!.latitude, _dragEnd!.latitude);
            final minLng = min(_dragStart!.longitude, _dragEnd!.longitude);
            final maxLng = max(_dragStart!.longitude, _dragEnd!.longitude);

            // Send a single event for the final bounds
            context.read<AppBloc>().add(CreateSearchZone(
              minLat: minLat, 
              maxLat: maxLat, 
              minLng: minLng, 
              maxLng: maxLng
            ));
            
            _clearSelectionPreview();
            setState(() {
              _isDrawing = false;
              _dragStart = null;
              _dragEnd = null;
            });
          },
          child: MapLibreMap(
            onMapCreated: _onMapCreated,
            onStyleLoadedCallback: _onStyleLoaded,
            initialCameraPosition: const CameraPosition(target: LatLng(34.5400, -112.4685), zoom: 14.0),
            styleString: "https://tiles.openfreemap.org/styles/liberty",
            myLocationEnabled: false, 
            trackCameraPosition: true,
            scrollGesturesEnabled: !_isDrawing, // Disable pan while drawing
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add_zone',
            mini: true,
            backgroundColor: _isDrawing ? Colors.orange : Colors.blue[100],
            onPressed: () {
              setState(() {
                _isDrawing = !_isDrawing;
                _dragStart = null;
                _dragEnd = null;
              });
              if (_isDrawing) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Long-press and drag on the map to define your search zone')));
              }
            },
            child: Icon(Icons.add_location_alt, color: _isDrawing ? Colors.white : Colors.blue),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'clear_grid',
            mini: true,
            backgroundColor: Colors.red[100],
            onPressed: () => context.read<AppBloc>().add(ClearGrid()),
            child: const Icon(Icons.layers_clear, color: Colors.red),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'recenter',
            mini: true,
            backgroundColor: Colors.white,
            onPressed: () {
              final state = context.read<AppBloc>().state;
              if (state.currentPosition != null) {
                mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(state.currentPosition!.latitude, state.currentPosition!.longitude)));
              }
            },
            child: const Icon(Icons.my_location, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return FloatingActionButton(
                heroTag: 'tracking_toggle',
                backgroundColor: state.isTracking ? Colors.red : Colors.green,
                onPressed: () {
                  if (state.isTracking) {
                    context.read<AppBloc>().add(StopTracking());
                  } else {
                    context.read<AppBloc>().add(const StartTracking(state: 'AZ', county: 'Yavapai'));
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

  void _updateUserMarker(AppState state) async {
    if (state.currentPosition == null || mapController == null) return;
    final pos = LatLng(state.currentPosition!.latitude, state.currentPosition!.longitude);
    if (_userCircle == null) {
      _userCircle = await mapController?.addCircle(CircleOptions(geometry: pos, circleColor: "#FF0000", circleRadius: 10.0, circleStrokeColor: "#FFFFFF", circleStrokeWidth: 2.0));
    } else {
      await mapController?.updateCircle(_userCircle!, CircleOptions(geometry: pos));
    }
  }

  void _updateGridMap(AppState state) async {
    if (mapController == null || !_isGridSourceAdded) return;
    final features = state.gridCells.map((cell) => {
      "type": "Feature",
      "geometry": jsonDecode(cell.geoJson),
      "properties": {"color": cell.coverage >= 1.0 ? "#3bb2d0" : "#555555"}
    }).toList();
    await mapController?.setGeoJsonSource("grid-source", {"type": "FeatureCollection", "features": features});
  }
}
