import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/HyppigesteAffaldstyper.dart';
import 'LocationPage.dart';
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
      debugShowCheckedModeBanner: false,
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
          fontSize: 32,
          ),
        ),
      ),
      body: Center( 
        child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 40, 12, 4),
            child: Container(
              height: 200,
              child: RichText(
                text: const TextSpan(
                  text: 'Velkommen!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), 
          ),
          HyppigsteAffaldstyper(),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 1, 12, 40),
            child: Container(
              height: 200,
              child: ListView(scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                  ),
                ],
              ),
            ),
          ),
          //HyppigsteAffaldstyper(),
          Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Container(
                height: 200,
                child: RichText(
                  text: const TextSpan(
                    text: 'Find vej til din\ngenbrugsstation ↓',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), 
            ),
        ],
        ),
      ),
      bottomNavigationBar: NavigationBarr(), 
    );
  }
}