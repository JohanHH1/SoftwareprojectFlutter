import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Home.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'SearchPage.dart';
import 'LocationPage.dart';

class NavigationBarr extends StatelessWidget {
  const NavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(color: Color(-4072000)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            tooltip: 'Home',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.pin_drop, color: Colors.black),
            tooltip: 'Map',
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const LocationPage()),
              );

            },
          ),
        ],
      ),
    );
  }
}

 






