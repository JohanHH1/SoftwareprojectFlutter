import 'dart:math';

import 'package:flutter/material.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocationPage extends StatefulWidget{
  const LocationPage({super.key});
  

  @override
  _MyLocationPageState createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<LocationPage> {
  List<Marker> _markers = [];
   String _errorMessage = '';
   final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _addTrashMarkers();
  }
//   Future<void> _addTrashMarkers() async {
//   try {
//     final String jsonString = await rootBundle.loadString('assets/export-3.geojson');
//     final jsonData = json.decode(jsonString);
//     final features = jsonData['features'];

//     List<double> longitudes = [];
//     List<double> latitudes = [];

//     for (var feature in features) {
//       final geometry = feature['geometry'];
//       if (geometry['type'] == 'Polygon') {
//         final coords = geometry['coordinates'][0];
//         for (var coord in coords) {
//           longitudes.add(coord[0]);
//           latitudes.add(coord[1]);
//         }
//       } else if (geometry['type'] == 'Point') {
//         final coords = geometry['coordinates'];
//         longitudes.add(coords[0]);
//         latitudes.add(coords[1]);
//       }
//     }

//     final avgLongitude = longitudes.reduce((a, b) => a + b) / longitudes.length;
//     final avgLatitude = latitudes.reduce((a, b) => a + b) / latitudes.length;

//     setState(() {
//       _markers = [
//         Marker(
//           width: 80.0,
//           height: 80.0,
//           point: LatLng(avgLatitude, avgLongitude),
//           child: const Icon(
//             Icons.location_on,
//             color: Colors.red,
//             size: 40.0,
//           ),
//         ),
//       ];
//     });
//   } catch (e) {
//     setState(() {
//       _errorMessage = 'Error loading markers: $e';
//     });
//   }
// }

Future<void> _addTrashMarkers() async {
  log(6.0);
   try {
     final String jsonString = await rootBundle.loadString('export-3.geojson');
     final jsonData = json.decode(jsonString);
     final features = jsonData['features'];

     setState(() {
       _markers = (features as List).map((feature) {
         final coordinates = feature['geometry']['coordinates'];
         
         return Marker(
           width: 80.0,
           height: 80.0,
           point: LatLng(coordinates[1], coordinates[0]),
           child: const Icon(
             Icons.location_on,
             color: Colors.red,
             size: 40.0,
           ),
         );
       }).toList();
     });
   } catch (e) {
     setState(() {
       _errorMessage = 'Error loading markers: $e';
     });
   }
   
 }

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
      mapController: _mapController,
      options: const MapOptions(
        initialCenter: LatLng(55.676098, 12.568337),
        initialZoom: 11,
        interactionOptions:
          InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom), 
        ),
        
      children: [
        openStreetMapTileLayer,
        CurrentLocationLayer(), 
          MarkerLayer(
                   markers: _markers,
                 ),],);   
  }

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  //userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);
}