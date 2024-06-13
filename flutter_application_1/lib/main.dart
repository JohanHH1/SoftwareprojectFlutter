import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/HyppigesteAffaldstyper.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importer filen med Firebase konfigurationen



void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Sikrer at bindinger er initialiseret før runApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);// Initialiser Firebase med de korrekte konfigurationsindstillinger
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteringshjælperen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
            child: Container(
              height: 200,
              child: RichText(
                text: const TextSpan(
                  text: 'Velkommen!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          HyppigsteAffaldstyper(),
        ],
      ),
      bottomNavigationBar: NavigationBarr(), 
    );
  }
}