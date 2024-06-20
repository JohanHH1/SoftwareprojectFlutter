import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'ItemDetailPage.dart';

class ItemList1 extends StatefulWidget {
  @override
  _ItemList1State createState() => _ItemList1State();
}

class _ItemList1State extends State<ItemList1> {
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> filteredItems = [];

  //Håndterer inputs i søgefeltet
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchItems();
    //En listener der kalder "filterItems" hver kan input ændrer sig i søgefeltet
    searchController.addListener(() {
      filterItems();
    });
  }

  Future<void> fetchItems() async {
    try {
      //Henter roden til vores firebase
      final storageRef = FirebaseStorage.instance.ref();
      //Henter den specifikke fil
      final trashRef = storageRef.child("trashItems/trash_items.json");

      //Henter vores data fra filen
      final data = await trashRef.getData();

      //Checker at vi har noget data
      if (data != null) {
        //Bruger jsonDecode fra convert packagen til at tage alt data og side i en list af dynamiske objekter,
        //hvilket er meget nemt at arbejde med.
        final jsonData = jsonDecode(utf8.decode(data)) as List<dynamic>;

        //JSON dataen starter som en liste med dynamiske objekter.
        //Herefter tages listen og laves til en ny liste, hvor hvert
        //element er et map med alt dataen om skraldet.
        final List<Map<String, dynamic>> itemDetails =
            jsonData.map((item) => item as Map<String, dynamic>).toList();

        // Opdaterer tilstanden
        setState(() {
          items = itemDetails;
          filteredItems = itemDetails;
        });
      } else {
        //Hvis der ikke er noget data
        throw Exception('Failed to load JSON data');
      }
    } catch (e) {
      //Printer fejl
      print('Error retrieving or parsing data: $e');
    }
  }

  void filterItems() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = items.where((item) {
        final name = item['name'].toString().toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Items'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['category']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(item: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
