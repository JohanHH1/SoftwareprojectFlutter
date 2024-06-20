import 'package:flutter/material.dart';


class ItemDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemDetailPage({super.key, required this.item});

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
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding around the green container
          child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 95, 174, 98), Color(-4072000)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(), // Optional: Adds bounce effect on scroll
              children: [
                Center(
                  child: Image.asset(
                    'assets/${item['image']}',
                    width: 300,
                    height: 300,
                  ),
                ),
                SizedBox(height: 20), // Vertical space between image and text
                Center(
                  child: Text(
                    item['name'],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10), // Vertical space between text and sorting type
                Center(
                  child: Text(
                    'Sorting type: ${item['category']}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20), // Vertical space between sorting type and category image
                Center(
                  child: Image.asset(
                    'assets/${item['category'] + '.png'}'.toLowerCase(),
                    width: 300,
                    height: 300,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 300),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (item['tips'] != '') 
                    Tooltip(
                      message: '${item['image']} tips',
                      child: const Icon(
                        Icons.lightbulb,
                        color: Color.fromARGB(255, 231, 215, 31),
                      ),
                    ),             
                 Expanded(
                    child: Text(
                      '${item['tips']}',
                      textAlign: TextAlign.center,
                    ),
                  ),            
                ],
              ),
            ],
            ),
          ),
        ),
      ),
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