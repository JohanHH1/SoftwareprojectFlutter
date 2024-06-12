import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255)),
      // Row is a horizontal, linear layout.
      
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip: 'Search',
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip: 'Home',
            onPressed: null,
          ),
          // Expanded expands its child
          // to fill the available space.
          IconButton(
            icon: Icon(Icons.pin_drop, color: Color.fromARGB(255, 36, 100, 38)),
            tooltip:'Map',
            onPressed: null,
          ),
          
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}
