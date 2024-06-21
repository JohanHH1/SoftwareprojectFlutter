
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;



class LocationPage extends StatefulWidget {
 const LocationPage({super.key, required this.title});
 final String title;

 @override
 State<LocationPage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<LocationPage> {
 String _errorMessage = '';
 final MapController _mapController = MapController();
 List<Marker> _markers1 = [];
 List<Marker> _markers2 = [];

@override
    void initState(){
      super.initState();
      _getCurrentLocation();
    }

 Future<void> _getCurrentLocation() async {
   try {
    await _addTrashMarkers('1');
    await _addTrashMarkers('2');
     setState(() {
       _errorMessage = ''; // Reset error message
     });
   } catch (e) {
     setState(() {
       _errorMessage = 'Error occurred: $e';
     });
   }
 }
  Future<void> _addTrashMarkers(String choosen) async {
    String export = 'assets/export-'+choosen+'.geojson';
   try {
     final String jsonString =
         await rootBundle.loadString(export);
     final jsonData = json.decode(jsonString);
     final features = jsonData['features'];

     setState(() {
       for (var feature in features) {
         final geometry = feature['geometry'];
         final coordinates = geometry['coordinates'];
         LatLng? firstCoordinate;

         if (geometry['type'] == 'Point') {
           firstCoordinate = LatLng(coordinates[1], coordinates[0]);
         } else if (geometry['type'] == 'LineString' || geometry['type'] == 'Polygon') {
           firstCoordinate = LatLng(coordinates[0][0][1], coordinates[0][0][0]);
         }

         if (firstCoordinate != null) {
          if(choosen == '1'){
           _markers1.add(
             Marker(
               width: 80.0,
               height: 80.0,
               point: firstCoordinate,
               child: const Icon(
                 Icons.recycling,
                 color: Colors.red,
                 size: 30.0,
               ),
             ),
           );
           } else if(choosen == '2'){
           _markers2.add(
             Marker(
               width: 80.0,
               height: 80.0,
               point: firstCoordinate,
               child: const Icon(
                 Icons.delete,
                 color: Color.fromARGB(155, 2, 42, 6),
                 size: 20.0,
               ),
             ),
           );
            }  
       }
     }});
   } catch (e) {
     setState(() {
       _errorMessage = 'Error loading markers: $e';
     });
   }
   
  }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Open Street Map',
          style: TextStyle(fontSize: 22),
        ),
      ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           const SizedBox(height: 5),
           Expanded(
             child: FlutterMap(
               mapController: _mapController,
               options: MapOptions(
                 initialCenter: LatLng(55.784099, 12.518576),
                 initialZoom: 12.0,
               ),
               children: [
                 TileLayer(
                   urlTemplate:
                       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                 ),
                 CurrentLocationLayer(),
                 MarkerLayer(
                   markers: _markers1,
                 ),
                 MarkerLayer(
                   markers: _markers2,
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
 }
}