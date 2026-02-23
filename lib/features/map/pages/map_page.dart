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

  bool _hasAutoCentered = false;
  bool _is3D = false;
  bool _isSatellite = false;

  final String _vectorStyle = "https://tiles.openfreemap.org/styles/liberty";
  
  // High-reliability Satellite Style JSON
  late final String _satelliteStyle = jsonEncode({
    "version": 8,
    "sources": {
      "satellite-tiles": {
        "type": "raster",
        "tiles": ["https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"],
        "tileSize": 256,
        "maxzoom": 18
      }
    },
    "layers": [{"id": "satellite-layer", "type": "raster", "source": "satellite-tiles"}]
  });

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  void _onStyleLoaded() async {
    _userCircle = null; 
    _isGridSourceAdded = false;
    _isSelectionSourceAdded = false;
    await _setupGridLayers();
    
    if (mounted) {
      final state = context.read<AppBloc>().state;
      _updateUserMarker(state);
      _updateGridMap(state);
    }
  }

  Future<void> _setupGridLayers() async {
    if (mapController == null) return;

    if (!_isGridSourceAdded) {
      try {
        await mapController?.addSource("grid-source", const GeojsonSourceProperties(data: {"type": "FeatureCollection", "features": []}));
        await mapController?.addFillLayer("grid-source", "grid-layer", const FillLayerProperties(
          fillColor: ["get", "color"],
          fillOpacity: 0.5,
          fillOutlineColor: "#ffffff",
        ));
        _isGridSourceAdded = true;
      } catch (e) { debugPrint("Grid source error: $e"); }
    }

    if (!_isSelectionSourceAdded) {
      try {
        await mapController?.addSource("selection-source", const GeojsonSourceProperties(data: {"type": "FeatureCollection", "features": []}));
        await mapController?.addFillLayer("selection-source", "selection-layer", const FillLayerProperties(
          fillColor: "#ff9800",
          fillOpacity: 0.3,
          fillOutlineColor: "#ff9800",
        ));
        _isSelectionSourceAdded = true;
      } catch (e) { debugPrint("Selection source error: $e"); }
    }
  }

  void _toggle3D() {
    setState(() {
      _is3D = !_is3D;
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: mapController!.cameraPosition!.target,
          tilt: _is3D ? 60.0 : 0.0, 
          zoom: mapController!.cameraPosition!.zoom,
        ),
      ));
    });
  }

  // Throttled update to prevent buffer overflow (ImageReader error)
  DateTime _lastPreviewUpdate = DateTime.now();
  void _updateSelectionPreview() async {
    if (mapController == null || _dragStart == null || _dragEnd == null || !_isSelectionSourceAdded) return;
    
    // Only update preview every 50ms to keep buffers happy
    if (DateTime.now().difference(_lastPreviewUpdate).inMilliseconds < 50) return;
    _lastPreviewUpdate = DateTime.now();

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

    try {
      await mapController?.setGeoJsonSource("selection-source", geoJson);
    } catch (e) { debugPrint("Preview update failed: $e"); }
  }

  void _clearSelectionPreview() async {
    if (_isSelectionSourceAdded) {
      try {
        await mapController?.setGeoJsonSource("selection-source", {"type": "FeatureCollection", "features": []});
      } catch (e) { _isSelectionSourceAdded = false; }
    }
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
            (previous.gridCells.isNotEmpty && 
             current.gridCells.isNotEmpty && 
             previous.gridCells.where((c) => c.coverage >= 1.0).length != 
             current.gridCells.where((c) => c.coverage >= 1.0).length),
        listener: (context, state) {
          if (!state.isTracking) { _hasAutoCentered = false; }
          if (state.isTracking && !_hasAutoCentered && state.currentPosition != null) {
            _hasAutoCentered = true;
            mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(state.currentPosition!.latitude, state.currentPosition!.longitude)));
          }
          _updateUserMarker(state);
          _updateGridMap(state);
        },
        child: GestureDetector(
          onLongPressStart: (details) async {
            if (!_isDrawing) return;
            final ratio = MediaQuery.of(context).devicePixelRatio;
            final latLng = await mapController?.toLatLng(Point(details.localPosition.dx * ratio, details.localPosition.dy * ratio));
            setState(() {
              _dragStart = latLng;
              _dragEnd = latLng;
            });
          },
          onLongPressMoveUpdate: (details) async {
            if (!_isDrawing || _dragStart == null) return;
            final ratio = MediaQuery.of(context).devicePixelRatio;
            final latLng = await mapController?.toLatLng(Point(details.localPosition.dx * ratio, details.localPosition.dy * ratio));
            setState(() => _dragEnd = latLng);
            _updateSelectionPreview();
          },
          onLongPressEnd: (details) async {
            if (!_isDrawing || _dragStart == null || _dragEnd == null) return;
            final minLat = min(_dragStart!.latitude, _dragEnd!.latitude);
            final maxLat = max(_dragStart!.latitude, _dragEnd!.latitude);
            final minLng = min(_dragStart!.longitude, _dragEnd!.longitude);
            final maxLng = max(_dragStart!.longitude, _dragEnd!.longitude);
            context.read<AppBloc>().add(CreateSearchZone(minLat: minLat, maxLat: maxLat, minLng: minLng, maxLng: maxLng));
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
            minMaxZoomPreference: MinMaxZoomPreference(0.0, _isSatellite ? 18.0 : 22.0),
            styleString: _isSatellite ? _satelliteStyle : _vectorStyle,
            myLocationEnabled: false, 
            trackCameraPosition: true,
            scrollGesturesEnabled: !_isDrawing, 
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'toggle_satellite',
            mini: true,
            backgroundColor: _isSatellite ? Colors.green : Colors.white,
            onPressed: () => setState(() => _isSatellite = !_isSatellite),
            child: Icon(Icons.map, color: _isSatellite ? Colors.white : Colors.green),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'toggle_3d',
            mini: true,
            backgroundColor: _is3D ? Colors.blue : Colors.white,
            onPressed: _toggle3D,
            child: Icon(Icons.terrain, color: _is3D ? Colors.white : Colors.blue),
          ),
          const SizedBox(height: 8),
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
      try { await mapController?.updateCircle(_userCircle!, CircleOptions(geometry: pos)); } catch (e) { _userCircle = null; }
    }
  }

  void _updateGridMap(AppState state) async {
    if (mapController == null || !_isGridSourceAdded) return;
    final features = state.gridCells.map((cell) => {
      "type": "Feature",
      "geometry": jsonDecode(cell.geoJson),
      "properties": {"color": cell.coverage >= 1.0 ? "#3bb2d0" : "#555555"}
    }).toList();
    try { await mapController?.setGeoJsonSource("grid-source", {"type": "FeatureCollection", "features": features}); } catch (e) { _isGridSourceAdded = false; }
  }
}
