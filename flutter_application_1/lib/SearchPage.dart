import 'package:flutter/material.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'main.dart';
import 'TrashItem.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  final TextEditingController _searchController = TextEditingController();
 final List<TrashItem> _allItems = allItems;


  @override
  void initState() {
    super.initState();
  }

  void _filterItems(String query) {
    final filtered = _allItems.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // setState(() {
    //   allItems. = filtered;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
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
            child: ListView.builder(
              itemCount: allItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allItems[index].name),
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