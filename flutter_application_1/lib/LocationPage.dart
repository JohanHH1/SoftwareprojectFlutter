
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
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

 void _onMarkerTapped(LatLng position,String name, String openHours) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(name),
        content: Text('Åbningstider: '+openHours),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
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
         final properties = feature['properties'];
         final name = geometry['name'];
         final openingHours = geometry['opening_hours'];
         LatLng? firstCoordinate;
         String? siteName;
         String? openHours;
        siteName = properties['name'] ?? 'Genbrugsplads';
        openHours = properties['opening_hours'] ?? 'Ukendt';
          

         if (geometry['type'] == 'Point') {
           firstCoordinate = LatLng(coordinates[1], coordinates[0]);
         } else if (geometry['type'] == 'LineString' || geometry['type'] == 'Polygon') {
           firstCoordinate = LatLng(coordinates[0][0][1], coordinates[0][0][0]);
         }
        //  if (properties['name'] == 'name') {
        //    siteName = name[0];
        //  }
        //  if (properties['opening_hours'] == 'opening_hours') {
        //    openHours = openingHours[0];
        //  }
         if (firstCoordinate != null) {
          if(choosen == '1'){
           _markers1.add(
             Marker(
               width: 80.0,
               height: 80.0,
               point: firstCoordinate,
               child: GestureDetector(
                onTap: () => _onMarkerTapped(firstCoordinate!, siteName!, openHours!),
               child: const Icon(
                 Icons.recycling,
                 color: Colors.red,
                 size: 35.0,
               ),  
             ),)
             );
           } else if(choosen == '2'){
           _markers2.add(
             Marker(
               width: 80.0,
               height: 80.0,
               point: firstCoordinate,
               child: const Icon(
                 Icons.delete,
                 color: Color.fromARGB(255, 5, 98, 14),
                 size: 15.0,
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