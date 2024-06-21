import 'package:flutter/material.dart';

class Madaffald extends StatelessWidget {
  const Madaffald({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madaffald'),
        backgroundColor: Color.fromARGB(255, 48, 186, 60),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green, // Green background color
        ),
        child: Center(
          child: Container(
            height: 200, // Adjust the height as needed
            width: 200, // Adjust the width as needed
            child: Image.asset(
              'assets/tennisbolde.png', // Replace with your image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ), 
        ),
      ),
    );
  }
}
