import 'package:flutter/material.dart';


class Metal extends StatelessWidget {
  const Metal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metal'),
        backgroundColor: Color.fromARGB(255, 55, 148, 230),
      ),
    );
  }
}