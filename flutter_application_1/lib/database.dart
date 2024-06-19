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
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchItems();
    searchController.addListener(() {
      filterItems();
    });
  }

  Future<void> fetchItems() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final trashRef = storageRef.child("trashItems/trash_items.json");

      final data = await trashRef.getData();
      if (data != null) {
      
        final jsonData = jsonDecode(utf8.decode(data)) as List<dynamic>;

        // Extract item details (assuming the JSON is a list of objects)
        final List<Map<String, dynamic>> itemDetails = jsonData.map((item) => item as Map<String, dynamic>).toList();

        // Update the state to display the items
        setState(() {
          items = itemDetails;
          filteredItems = itemDetails;
        });
      } else {
        throw Exception('Failed to load JSON data');
      }
    } catch (e) {
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
            child: filteredItems.isEmpty
                ? CircularProgressIndicator()
                : ListView.builder(
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