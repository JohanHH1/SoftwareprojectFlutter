import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'ItemDetailPage.dart';

class Searchpage extends StatefulWidget {
  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
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
        throw Exception('Kunne ikke finde data');
      }
    } catch (e) {
      //Printer fejl
      print('Der skete en fejl: $e');
    }
  }

  //Sorterer skrald baseret på input i søgefeltet
  //Sørger for kun at vise de ting man er ved at søge på
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
        title: const Text(
          'Find dit skrald',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 48, 40, 40),
          ),
        ),
        backgroundColor: Color(-4072000),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Søg',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          //Viser listen af sorterede ting.
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['category']),
                  onTap: () {
                    //Når der vælges noget skrald sendes brugeren over til siden med alt information om skraldet.
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
}
