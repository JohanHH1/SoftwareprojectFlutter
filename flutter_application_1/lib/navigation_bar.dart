import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Home.dart';
import 'package:flutter_settings_bar_design/database.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'SearchPage.dart';
import 'LocationPage.dart';
import 'database.dart';

class NavigationBarr extends StatelessWidget {
  const NavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 172, 206, 171)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                  ),
                  Text('Hjem', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                  ),
                  Text('Søg', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.pin_drop, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LocationPage(title: '',)),
                      );
                    }
                  ),
                  Text('Kort', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.inventory, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ItemList1()),
                      );
                    },
                  ),
                  Text('Items', style: TextStyle(color: Colors.black)),
                ],
                ),
            ],
          ),
        );
  }}