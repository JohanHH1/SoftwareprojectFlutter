import 'package:flutter/material.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importer filen med Firebase konfigurationen


<<<<<<< Updated upstream
void main() => runApp(const MyApp());
=======
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Sikrer at bindinger er initialiseret før runApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);// Initialiser Firebase med de korrekte konfigurationsindstillinger
runApp(const MyApp());
}
>>>>>>> Stashed changes

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
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: const Column( 
      children: [
        Expanded(
        child: Center(
          child: Text('Hello,world'),
        ),
      ),
      NavigationBarr(),
      ],
     ),
    );
  }
}