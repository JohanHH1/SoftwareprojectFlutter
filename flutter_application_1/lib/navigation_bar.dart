import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Home.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'SearchPage.dart';
import 'LocationPage.dart';

class NavigationBarr extends StatelessWidget {
  const NavigationBarr({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(color: Color(-4072000)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.black),
                  SizedBox(height: 4),
                  Text('Hjem', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(height: 4),
                  Text('Søg', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pin_drop, color: Colors.black),
                  SizedBox(height: 4),
                  Text('Kort', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 






