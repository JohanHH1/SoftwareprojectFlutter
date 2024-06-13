import 'package:flutter/material.dart';

class HyppigsteAffaldstyper extends StatelessWidget {
  const HyppigsteAffaldstyper ({super.key});

@override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hyppigste affaldstyper',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12), // Add spacing between header and content
              ],
            ),
    );
  }
}