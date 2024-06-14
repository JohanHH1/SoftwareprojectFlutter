import 'package:flutter/material.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class LocationPage extends StatefulWidget{
  const LocationPage({super.key});

  @override
  _MyLocationPageState createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Open Street Map',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: content()
    );
  }
  Widget content() {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(55.676098, 12.568337),
        initialZoom: 11,
        interactionOptions:
          InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom), 
        ),
      children: [
        openStreetMapTileLayer,
        CurrentLocationLayer(),
      ],
    );
  }
  
}
TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);