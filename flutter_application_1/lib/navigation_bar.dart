import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'SearchPage.dart';

class NavigationBarr extends StatelessWidget {
  const NavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip: 'Home',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.pin_drop, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip: 'Map',
            onPressed: () {
<<<<<<< Updated upstream
              // Add your onPressed logic here
=======
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const LocationPage()),
              );
>>>>>>> Stashed changes
            },
          ),
        ],
      ),
    );
  }
}

 






