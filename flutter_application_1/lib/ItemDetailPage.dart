import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
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
    );
  }
}
