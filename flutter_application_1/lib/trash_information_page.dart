import 'package:flutter/material.dart';
import 'TrashItem.dart';

class trash_information_page extends StatelessWidget {
  final TrashItem trashItem;

  const trash_information_page({Key? key, required this.trashItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trashItem.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${trashItem.name}'),
            Text('Sorting Type: ${trashItem.sortingType}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
