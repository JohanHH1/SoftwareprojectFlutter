import 'package:flutter/material.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'main.dart';
import 'TrashItem.dart';
import 'trash_information_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  final TextEditingController _searchController = TextEditingController();
 final List<TrashItem> _allItems = allItems;
  List<TrashItem> _filteredItems = []; // Tilføj denne linje for at definere _filteredItems



  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems; // Initialiser _filteredItems med alle elementer i starten
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _allItems.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        automaticallyImplyLeading: false, // Fjern tilbagepilen
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                _filterItems(query);
              },
            ),
          ),
          Expanded(
            child:ListView.builder(
  itemCount: _filteredItems.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(_filteredItems[index].name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => trash_information_page(trashItem: _filteredItems[index]),
          ),
        );
      },
    );
  },
),


),

          const NavigationBarr(),
        ],
      ),
      );
  }
}