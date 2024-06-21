import 'package:flutter/material.dart';

//Dataen om alt skraldet som f.eks. navn, kategori osv bliver vist hvor det skal.
//Billeder ligger lokalt med appen, og tilgås med pathen samt navnet der kommer fra JSON filen.

class ItemDetailPage extends StatelessWidget {
  //Tager imod det valgte skrald med alt det tilhørende information.
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
          padding: const EdgeInsets.all(20.0), // Grønd kant
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
              physics: const BouncingScrollPhysics(), // Bounce effekt på scroll
              children: [
                Center(
                  child: Image.asset(
                    'assets/${item['image']}',
                    width: 300,
                    height: 300,
                  ),
                ),
                const SizedBox(height: 20), // Mellemrum mellem billede og tekst
                Center(
                  child: Text(
                    item['name'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10), // Mellemrum mellem tekst og tips
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Tips bliver kun vist hvis der er et.
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
                const SizedBox(
                    height:
                        20), // Mellemrum mellem tip og billede af affaldskategori
                Center(
                  child: Image.asset(
                    'assets/${item['category'].toLowerCase().replaceAll(' ', '_') + '.png'}'
                        .toLowerCase(),
                    width: 300,
                    height: 300,
                  ),
                ),
                const SizedBox(
                    height: 20,
                    width:
                        300), //Mellemrum mellem billede af affaldskategori og affaldstype
                Center(
                  child: Text(
                    'Affaldstype: ${item['category']}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
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