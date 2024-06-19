import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/pap.dart';

class Affaldstyper extends StatelessWidget {
  const Affaldstyper({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(4, (index) => 'Pap $index'); // Example list with 4 items

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oversigt over affaldstyperne'),
        backgroundColor: Color.fromARGB(255, 152, 231, 159),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 1, // Horizontal spacing between items
          mainAxisSpacing: 1, // Vertical spacing between items
          childAspectRatio: 0.75, // Ratio for width/height of each item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pap()),
              );
            },
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/notDefined.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Text(
                  items[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}