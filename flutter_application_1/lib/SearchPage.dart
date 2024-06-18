import 'package:flutter/material.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'main.dart';
import 'TrashItem.dart';
import 'trash_information_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ItemDetailPage.dart';
/*
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = "";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<QuerySnapshot> _getItems() async {
    if (searchQuery.isEmpty) {
      return await FirebaseFirestore.instance.collection('trashItems').get();
    } else {
      return await FirebaseFirestore.instance
          .collection('trashItems')
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThanOrEqualTo: searchQuery + '\uf8ff')
          .get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Items"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Search by name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      searchQuery = "";
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
              future: _getItems(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var items = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(item['type']),
                      leading: Image.network(item['imageUrl']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailPage(documentId: item.id),
                          ),
                        );
                      },
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

*/
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
        title: const Text('Sorteringsguide'),
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
