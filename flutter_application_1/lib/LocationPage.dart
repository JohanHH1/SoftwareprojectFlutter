import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
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
  String _errorMessage =
      ''; // bruges kun til at opbevare fejl, men bliver aldrig vist
  final MapController _mapController = MapController();
  final List<Marker> _markers1 = []; //genbrugspladser
  final List<Marker> _markers2 = []; //affalds containere

  @override
  void initState() {
    super.initState();
    _addAllMarkers(); // tilføjer alle skralde markørende
  }

  Future<void> _addAllMarkers() async {
    await _addTrashMarkers('1'); // tilføjer alle røde genbrugspladsers markør fra fil 1
    await _addTrashMarkers('2'); // tilføjer alle affalds containere fra fil 2
    setState(() {
      _errorMessage = ''; // fanger eventuelle fejl beskeder
    });
  }

  // funktion til hvad der skal stå når man "tapper" på en genbrugsplads
  void _onMarkerTapped(LatLng position, String name, String openHours) {
    showDialog( // åbner et lille vindue foran kortet
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name), // displayer navn
          content: Text('Åbningstider: $openHours'), // displayer
          actions: [
            TextButton( // laver en knap til at forlade det lille vindue.
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // fjerne vinduet fra skærmen
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addTrashMarkers(String choosen) async {
    String export = 'assets/export-$choosen.geojson'; // definere en filsti til den valgte fil med tallet choosen
    try {
      final String jsonString =
          await rootBundle.loadString(export); // loader filen ind som string
      final jsonData =
          json.decode(jsonString); //decoder stringen til et dart objekt
      final features = jsonData['features']; // finder alle features i obejktet.

      setState(() {
        for (var feature in features) {
          final geometry = feature['geometry']; // finder geometry i featuren
          final coordinates = geometry['coordinates']; //finder koordinaterne i geometry
          final properties = feature['properties']; // finder properties i featuren
          LatLng? firstCoordinate;
          String? siteName;
          String? openHours;
          siteName = properties['name'] ?? 'Genbrugsplads'; //hvis der findes et navn så gem navnet, ellers 'genbrugsplads'
          openHours = properties['opening_hours'] ?? 'Ukendt'; //hvis der findes åbningstider så gem dem, ellers 'ukendt'

          if (geometry['type'] == 'Point') { // hvis der kun er et koordinat så laver vi en markør i dette punkt
            firstCoordinate = LatLng(coordinates[1], coordinates[0]);
          } else if (geometry['type'] == 'LineString' ||
              geometry['type'] == 'Polygon') { // hvis der er flere koordinater
            firstCoordinate = LatLng(
                coordinates[0][0][1],
                coordinates[0][0][0]); //så tager vi det første og laver en markør der
          } //
          if (firstCoordinate != null) { // hvis der er en koorniat så fortsætter vi
            if (choosen == '1') {
              _markers1.add(
                Marker(
                width: 80.0,
                height: 80.0,
                point: firstCoordinate,
                child: GestureDetector(
                  // ved første dokument gør vi at man kan trykke på dem og se deres oplysninger
                  onTap: () =>
                      _onMarkerTapped(firstCoordinate!, siteName!, openHours!),
                  child: const Icon(
                    Icons.recycling, // de bliver vist som røde genbrugs symboler
                    color: Colors.red,
                    size: 35.0,
                  ),
                ),
              ));
            } else if (choosen == '2') {
              _markers2.add(
                Marker( // andet dokument bliver vist som små grønne skraldespande
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
        }
      });
    } catch (e) { // try catch til at fange fejl
      setState(() {
        _errorMessage = 'Error loading markers: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // standart titel og baggrundsfarve
        title: const Text(
          'Kort over sorteringssteder',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: const Color(-4072000),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlutterMap(
                // kortet initaliseres
                mapController: _mapController,
                options: const MapOptions(
                  initialCenter: LatLng(55.784099, 12.518576),
                  initialZoom: 12.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: // openstreetmap bruges til at sætte kortet op
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  CurrentLocationLayer(), // loader brugeres live lokalition
                  MarkerLayer( // tilføjer de to forskellige grupper af markør
                    markers: _markers1,
                  ),
                  MarkerLayer(
                    markers: _markers2,
                  ),
                  Positioned( // tilføjer en info box der forklare hvad der er hvad
                    left: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Juster radius for rundere hjørner
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // tilføjer skygge
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // Ændring af skyggeeffekten
                          ),
                        ],
                      ),
                      child: const Row( // selve informationen insættes som standart
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.recycling,
                                color: Colors.red,
                                size: 20.0,
                              ),
                              SizedBox(width: 5),
                              Text('Genbrugsplads'),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 5, 98, 14),
                                size: 20.0,
                              ),
                              SizedBox(width: 5),
                              Text('Affaldscontainer'),
                            ],
                          ),
                        ],
                      ),
                    ),
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
