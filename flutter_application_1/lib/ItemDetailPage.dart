import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemDetailPage extends StatelessWidget {
  final String documentId;

  ItemDetailPage({required this.documentId});

  Future<DocumentSnapshot> getItemById(String documentId) async {
    DocumentReference docRef = FirebaseFirestore.instance.collection('trashItems').doc(documentId);
    DocumentSnapshot docSnapshot = await docRef.get();
    return docSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getItemById(documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text("Item not found"));
          }
          var item = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${item['name']}", style: TextStyle(fontSize: 24)),
                SizedBox(height: 8),
                Text("Type: ${item['type']}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text("Description: ${item['description']}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Image.network(item['imageUrl']),
              ],
            ),
          );
        },
      ),
    );
  }
}
