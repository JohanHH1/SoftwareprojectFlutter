import 'package:flutter/material.dart';
import 'TrashItem.dart';

class ItemDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item['name'],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),  // Yderligere plads rundt om dataene
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [ Color.fromARGB(255, 95, 174, 98),  Color(-4072000)], // Gradient farver
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(12.0), // Rundede hjørner
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Sorting type: ${item['category']}', style: const TextStyle(fontSize: 16)),
              Image.asset('assets/${item['image']}',
                width: 300,
                height: 300,
              ),
            ],
        ),

        )
        )
        );  
        }
}

/*
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item['image'] != null)
              Image.asset(
                'assets/${item['image']}',
                width: 100,
                height: 100,
              ),
            SizedBox(height: 8),
            Text('Name: ${item['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Category: ${item['category']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Description: ${item['description']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      */