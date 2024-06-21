import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Affaldstyper.dart';
import 'package:flutter_settings_bar_design/Home.dart';
import 'package:flutter_settings_bar_design/trash_information_page.dart';
import 'navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importer filen med Firebase konfigurationen
import 'package:readmore/readmore.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Sikrer at bindinger er initialiseret før runApp
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); // Initialiser Firebase med de korrekte konfigurationsindstillinger
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
