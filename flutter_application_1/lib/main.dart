import 'package:flutter/material.dart';
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
        title: const Text('Home Page'),
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

