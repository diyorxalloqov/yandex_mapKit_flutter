import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapsPage extends StatefulWidget {
  const YandexMapsPage({super.key});

  @override
  State<YandexMapsPage> createState() => _YandexMapsPageState();
}

class _YandexMapsPageState extends State<YandexMapsPage> {
   final Completer<YandexMapController> _controller =
      Completer<YandexMapController>();
  PolylinePoints polylinePoints = PolylinePoints();

  Location location = Location();
  // Map<MarkerId, Marker> markers = {};
  late bool _serviceEnabled;

  late PermissionStatus _permissionGranted;

  late LocationData _locationData;
  // List<LatLng> polylineCoordinates = [];
  // Map<PolylineId, Polyline> polylines = {};
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yandex Map"),
      ),
      body: Column(
        children: [
          Expanded(
            child: YandexMap(
              onMapCreated: (YandexMapController controller) async {
                await controller.getMaxZoom();
                controller.getCameraPosition();
              },
              mapType: MapType.map,
              fastTapEnabled: true,
              logoAlignment: const MapAlignment(
                  horizontal: HorizontalAlignment.right,
                  vertical: VerticalAlignment.bottom),
                  // onCameraPositionChanged: ,
                  
              onUserLocationAdded: (view) {
                return;
              },
              onMapTap: (Point point) {
                print('Tapped on map at $point');
                print(point.latitude);
                print(point.longitude);
                
              },
            ),
          ),
        ],
      ),
    );
  }
}

