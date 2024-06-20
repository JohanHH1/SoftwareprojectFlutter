
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       useMaterial3: true,
     ),
     home: const LocationPage(title: 'Flutter Demo Home Page'),
   );
 }
}



class LocationPage extends StatefulWidget {
 const LocationPage({super.key, required this.title});
 final String title;

 @override
 State<LocationPage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<LocationPage> {
 String _errorMessage = '';
 final MapController _mapController = MapController();
 List<Marker> _markers = [];

@override
    void initState(){
      super.initState();
      _getCurrentLocation();
       CurrentLocationLayer();
    }
  


 Future<void> _getCurrentLocation() async {
   try {
    await _addTrashBinMarkers();
     setState(() {
       _errorMessage = ''; // Reset error message
     });
   } catch (e) {
     setState(() {
       _errorMessage = 'Error occurred: $e';
     });
   }
 }


 Future<void> _addTrashBinMarkers() async {
   try {
     final String jsonString =
         await rootBundle.loadString('assets/export-5.geojson');
     final jsonData = json.decode(jsonString);
     final features = jsonData['features'];

     setState(() {
       _markers.addAll((features as List).map((feature) {
         final coordinates = feature['geometry']['coordinates'];

         return Marker(
           width: 80.0,
           height: 80.0,
           point: LatLng(coordinates[1], coordinates[0]),
           child: const Icon(
             Icons.location_on,
             color: Colors.red,
             size: 30.0,
           ),
         );
       }).toList());
     });
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
           ElevatedButton(
             onPressed: _getCurrentLocation,
             child: const Text("Se genbrugsstationer"),
           ),
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
                   markers: _markers,
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