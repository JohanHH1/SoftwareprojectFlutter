import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/HyppigesteAffaldstyper.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';

void main() => runApp(const MyApp());

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

