import 'package:flutter/material.dart';


class MadOgDrikkekartoner extends StatelessWidget {
  const MadOgDrikkekartoner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview.builder'),
        backgroundColor: Color.fromARGB(255, 55, 148, 230),
      ),
      body: ListView.separated(
  itemCount: 10,
  separatorBuilder: (context, index) => Divider(), // Separator between items
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item $index'),
      onTap: () {
        // Handle tap on item
        print('Tapped on Item $index');
      },
    );
  },
)

      ); 
  }
}